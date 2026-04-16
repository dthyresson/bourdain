import React from 'react';
import { Box, Text } from 'ink';
import { TopIngredient } from '../db.js';

interface IngredientsTableProps {
  ingredients: TopIngredient[];
}

export const IngredientsTable: React.FC<IngredientsTableProps> = ({ ingredients }) => {
  if (ingredients.length === 0) {
    return (
      <Box>
        <Text color="gray">No ingredient data available</Text>
      </Box>
    );
  }

  return (
    <Box flexDirection="column" borderStyle="round" borderColor="green" padding={1}>
      <Text bold color="green">Top Ingredients by Recipe Count</Text>
      <Box marginTop={1} flexDirection="column">
        {/* Header */}
        <Box flexDirection="row">
          <Box width={6}>
            <Text bold color="gray">Rank</Text>
          </Box>
          <Box width={25}>
            <Text bold color="gray">Ingredient</Text>
          </Box>
          <Box width={15}>
            <Text bold color="gray">Recipes</Text>
          </Box>
          <Box flexGrow={1}>
            <Text bold color="gray">Bar</Text>
          </Box>
        </Box>
        
        {/* Rows */}
        {ingredients.map((ing, idx) => {
          const maxCount = ingredients[0]?.recipeCount || 1;
          const barLength = Math.round((ing.recipeCount / maxCount) * 20);
          const bar = '█'.repeat(barLength);
          
          return (
            <Box key={idx} flexDirection="row">
              <Box width={6}>
                <Text color="yellow">#{ing.rank}</Text>
              </Box>
              <Box width={25}>
                <Text>{ing.name}</Text>
              </Box>
              <Box width={15}>
                <Text color="cyan">{ing.recipeCount}</Text>
              </Box>
              <Box flexGrow={1}>
                <Text color="green">{bar}</Text>
              </Box>
            </Box>
          );
        })}
      </Box>
    </Box>
  );
};
