import React from 'react';
import { Box, Text } from 'ink';
import { MealTypeCount } from '../db.js';

interface MealTypeChartProps {
  mealTypes: MealTypeCount[];
}

const MEAL_COLORS: Record<string, string> = {
  breakfast: 'yellow',
  lunch: 'green',
  dinner: 'blue',
  snack: 'magenta',
  dessert: 'red',
};

export const MealTypeChart: React.FC<MealTypeChartProps> = ({ mealTypes }) => {
  if (mealTypes.length === 0) {
    return (
      <Box>
        <Text color="gray">No meal type data available</Text>
      </Box>
    );
  }

  const maxCount = Math.max(...mealTypes.map(m => m.count));

  return (
    <Box flexDirection="column" borderStyle="round" borderColor="magenta" padding={1}>
      <Text bold color="magenta">Recipes by Meal Type</Text>
      <Box marginTop={1} flexDirection="column">
        {mealTypes.map((mealType, idx) => {
          const barLength = maxCount > 0 
            ? Math.round((mealType.count / maxCount) * 25) 
            : 0;
          const bar = '█'.repeat(barLength);
          const color = MEAL_COLORS[mealType.mealType] || 'cyan';
          
          return (
            <Box key={idx} flexDirection="row">
              <Box width={12}>
                <Text>{mealType.mealType.charAt(0).toUpperCase() + mealType.mealType.slice(1)}</Text>
              </Box>
              <Box flexGrow={1}>
                <Text color={color}>{bar}</Text>
                <Text> {mealType.count}</Text>
              </Box>
            </Box>
          );
        })}
      </Box>
    </Box>
  );
};
