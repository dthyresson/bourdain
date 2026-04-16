import React, { useState, useEffect } from 'react';
import { Box, Text, useApp, useInput } from 'ink';
import { RecipeDatabase, RecipeMetrics, CuisineCount, MealTypeCount, TopIngredient, EffortDistribution, SpiceDistribution } from '../db.js';
import { MetricsPanel } from './MetricsPanel.js';
import { CuisineChart } from './CuisineChart.js';
import { MealTypeChart } from './MealTypeChart.js';
import { IngredientsTable } from './IngredientsTable.js';
import { BarChart } from './BarChart.js';

const REFRESH_INTERVAL = 5000; // 5 seconds

const Dashboard: React.FC = () => {
  const { exit } = useApp();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [metrics, setMetrics] = useState<RecipeMetrics | null>(null);
  const [cuisines, setCuisines] = useState<CuisineCount[]>([]);
  const [mealTypes, setMealTypes] = useState<MealTypeCount[]>([]);
  const [topIngredients, setTopIngredients] = useState<TopIngredient[]>([]);
  const [effortDist, setEffortDist] = useState<EffortDistribution[]>([]);
  const [spiceDist, setSpiceDist] = useState<SpiceDistribution[]>([]);
  const [lastUpdated, setLastUpdated] = useState<Date | null>(null);
  const [isRefreshing, setIsRefreshing] = useState(false);
  const [countdown, setCountdown] = useState(REFRESH_INTERVAL / 1000);

  useInput((input, key) => {
    if (input === 'q' || key.escape) {
      exit();
    }
    if (input === 'r' || input === 'R') {
      loadData();
    }
  });

  const loadData = async () => {
    if (isRefreshing) return;
    
    setIsRefreshing(true);
    const db = new RecipeDatabase();
    try {
      await db.connect();
      
      const [
        metricsData,
        cuisineData,
        mealTypeData,
        ingredientData,
        effortData,
        spiceData
      ] = await Promise.all([
        db.getMetrics(),
        db.getCuisineCounts(),
        db.getMealTypeCounts(),
        db.getTopIngredients(10),
        db.getEffortDistribution(),
        db.getSpiceDistribution()
      ]);

      setMetrics(metricsData);
      setCuisines(cuisineData);
      setMealTypes(mealTypeData);
      setTopIngredients(ingredientData);
      setEffortDist(effortData);
      setSpiceDist(spiceData);
      setLastUpdated(new Date());
      setLoading(false);
      setError(null);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Unknown error');
      setLoading(false);
    } finally {
      await db.close();
      setIsRefreshing(false);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  useEffect(() => {
    if (loading) return;
    
    // Countdown timer
    const countdownInterval = setInterval(() => {
      setCountdown(prev => {
        if (prev <= 1) return REFRESH_INTERVAL / 1000;
        return prev - 1;
      });
    }, 1000);

    // Data refresh
    const refreshInterval = setInterval(() => {
      loadData();
    }, REFRESH_INTERVAL);

    return () => {
      clearInterval(countdownInterval);
      clearInterval(refreshInterval);
    };
  }, [loading]);

  if (loading) {
    return (
      <Box flexDirection="column" alignItems="center" padding={2}>
        <Text color="cyan">Loading recipe metrics...</Text>
        <Text color="gray">Connecting to database</Text>
      </Box>
    );
  }

  if (error) {
    return (
      <Box flexDirection="column" padding={2}>
        <Text color="red" bold>Error loading data:</Text>
        <Text color="red">{error}</Text>
        <Box marginTop={1}>
          <Text color="gray">Press 'q' or ESC to exit</Text>
        </Box>
      </Box>
    );
  }

  const effortChartData = effortDist.map(e => ({
    label: e.effort.charAt(0).toUpperCase() + e.effort.slice(1),
    value: e.count,
    color: e.effort === 'easy' ? 'green' : e.effort === 'medium' ? 'yellow' : 'red'
  }));

  const spiceChartData = spiceDist.map(s => ({
    label: `Level ${s.spiceLevel}`,
    value: s.count,
    color: s.spiceLevel === 0 ? 'green' : s.spiceLevel === 1 ? 'yellow' : s.spiceLevel === 2 ? 'red' : 'magenta'
  }));

  return (
    <Box flexDirection="column" padding={1}>
      {/* Header */}
      <Box marginBottom={1} flexDirection="row" justifyContent="space-between">
        <Box>
          <Text bold color="cyan" backgroundColor="black"> Bourdain Analytics Dashboard </Text>
          <Text color="gray"> | Press 'q' or ESC to exit | 'r' to refresh</Text>
        </Box>
        <Box flexDirection="row" gap={2}>
          {isRefreshing ? (
            <Text color="yellow" bold>⟳ REFRESHING DATA...</Text>
          ) : (
            <>
              <Text color="gray">Next refresh: </Text>
              <Text color="cyan">{countdown}s</Text>
            </>
          )}
          {lastUpdated && !isRefreshing && (
            <Text color="gray">
              | Updated: {lastUpdated.toLocaleTimeString()}
            </Text>
          )}
        </Box>
      </Box>

      {/* Metrics Overview */}
      {metrics && <MetricsPanel metrics={metrics} />}

      {/* Main Content - Two Column Layout */}
      <Box marginTop={1} flexDirection="row" gap={2}>
        {/* Left Column */}
        <Box flexDirection="column" width="50%">
          <CuisineChart cuisines={cuisines} />
          <Box marginTop={1}>
            <BarChart 
              data={effortChartData} 
              title="Recipes by Effort Level"
              maxWidth={30}
            />
          </Box>
        </Box>

        {/* Right Column */}
        <Box flexDirection="column" width="50%">
          <MealTypeChart mealTypes={mealTypes} />
          <Box marginTop={1}>
            <BarChart 
              data={spiceChartData} 
              title="Recipes by Spice Level"
              maxWidth={30}
            />
          </Box>
        </Box>
      </Box>

      {/* Bottom Section - Ingredients Table */}
      <Box marginTop={1}>
        <IngredientsTable ingredients={topIngredients} />
      </Box>
    </Box>
  );
};

export default Dashboard;
