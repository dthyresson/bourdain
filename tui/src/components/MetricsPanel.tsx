import React from 'react';
import { Box, Text } from 'ink';
import { RecipeMetrics } from '../db.js';

interface MetricsPanelProps {
  metrics: RecipeMetrics;
}

export const MetricsPanel: React.FC<MetricsPanelProps> = ({ metrics }) => {
  return (
    <Box flexDirection="column" borderStyle="round" borderColor="cyan" padding={1}>
      <Text bold color="cyan">Recipe Database Overview</Text>
      <Box marginTop={1} flexDirection="row" gap={4}>
        <Box flexDirection="column">
          <Text color="gray">Total Recipes</Text>
          <Text bold color="green">{metrics.totalRecipes}</Text>
        </Box>
        <Box flexDirection="column">
          <Text color="gray">Total Ingredients</Text>
          <Text bold color="yellow">{metrics.totalIngredients}</Text>
        </Box>
        <Box flexDirection="column">
          <Text color="gray">Avg Cook Time</Text>
          <Text bold color="magenta">{metrics.avgCookTime}m</Text>
        </Box>
        <Box flexDirection="column">
          <Text color="gray">Avg Spice Level</Text>
          <Text bold color="red">{metrics.avgSpiceLevel}/3</Text>
        </Box>
      </Box>
    </Box>
  );
};
