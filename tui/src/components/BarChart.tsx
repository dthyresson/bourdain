import React from 'react';
import { Box, Text } from 'ink';

interface BarChartProps {
  data: { label: string; value: number; color?: string }[];
  maxWidth?: number;
  title?: string;
}

const COLORS = {
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  magenta: '\x1b[35m',
  cyan: '\x1b[36m',
  white: '\x1b[37m',
  gray: '\x1b[90m',
  reset: '\x1b[0m',
};

export const BarChart: React.FC<BarChartProps> = ({ 
  data, 
  maxWidth = 40,
  title 
}) => {
  if (data.length === 0) return null;

  const maxValue = Math.max(...data.map(d => d.value));
  const maxLabelLength = Math.max(...data.map(d => d.label.length));

  return (
    <Box flexDirection="column">
      {title && (
        <Box marginBottom={1}>
          <Text bold underline>{title}</Text>
        </Box>
      )}
      {data.map((item, index) => {
        const barLength = maxValue > 0 
          ? Math.round((item.value / maxValue) * maxWidth) 
          : 0;
        const bar = '█'.repeat(barLength);
        const color = item.color || 'cyan';
        const colorCode = COLORS[color as keyof typeof COLORS] || COLORS.cyan;
        
        return (
          <Box key={index}>
            <Box width={maxLabelLength + 2}>
              <Text>{item.label.padEnd(maxLabelLength)}</Text>
            </Box>
            <Text>{colorCode}{bar}{COLORS.reset} {item.value}</Text>
          </Box>
        );
      })}
    </Box>
  );
};
