import React from 'react';
import { Box, Text } from 'ink';
import { CuisineCount } from '../db.js';

interface CuisineChartProps {
  cuisines: CuisineCount[];
}

const CUISINE_COLORS: Record<string, string> = {
  chinese: 'red',
  american: 'blue',
  italian: 'green',
  thai: 'yellow',
  indian: 'magenta',
};

export const CuisineChart: React.FC<CuisineChartProps> = ({ cuisines }) => {
  if (cuisines.length === 0) {
    return (
      <Box>
        <Text color="gray">No cuisine data available</Text>
      </Box>
    );
  }

  const maxCount = Math.max(...cuisines.map(c => c.count));

  return (
    <Box flexDirection="column" borderStyle="round" borderColor="blue" padding={1}>
      <Text bold color="blue">Recipes by Cuisine</Text>
      <Box marginTop={1} flexDirection="column">
        {cuisines.map((cuisine, idx) => {
          const barLength = maxCount > 0 
            ? Math.round((cuisine.count / maxCount) * 25) 
            : 0;
          const bar = '█'.repeat(barLength);
          const color = CUISINE_COLORS[cuisine.cuisine] || 'cyan';
          
          return (
            <Box key={idx} flexDirection="row">
              <Box width={12}>
                <Text>{cuisine.cuisine.charAt(0).toUpperCase() + cuisine.cuisine.slice(1)}</Text>
              </Box>
              <Box flexGrow={1}>
                <Text color={color}>{bar}</Text>
                <Text> {cuisine.count}</Text>
              </Box>
            </Box>
          );
        })}
      </Box>
    </Box>
  );
};
