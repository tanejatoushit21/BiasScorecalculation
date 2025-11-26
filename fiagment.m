
G = digraph(SourceNodes, TargetNodes, Weights, AllNodes);


NumNodes = size(G.Nodes, 1);
XData = zeros(1, NumNodes);
YData = zeros(1, NumNodes);
NodeIndices_Global = find(strcmp(G.Nodes.Name, 'GlobalAnalysis'));
XData(NodeIndices_Global) = 0;
YData(NodeIndices_Global) = 0;
NodeIndices_Factors = find(ismember(G.Nodes.Name, FactorNodes));
R_factors = 3;
AngleStep_F = 2*pi / length(NodeIndices_Factors);
for i = 1:length(NodeIndices_Factors)
    angle = (i - 1) * AngleStep_F;
    XData(NodeIndices_Factors(i)) = R_factors * cos(angle);
    YData(NodeIndices_Factors(i)) = R_factors * sin(angle);
end
NodeIndices_Countries = find(ismember(G.Nodes.Name, CountryNodes));
R_countries = 6;7
AngleStep_C = 2*pi / length(NodeIndices_Countries);
for i = 1:length(NodeIndices_Countries)
    angle = (i - 1) * AngleStep_C;
    XData(NodeIndices_Countries(i)) = R_countries * cos(angle);
    YData(NodeIndices_Countries(i)) = R_countries * sin(angle);
end

% --- C. Plot the Graph Using Manual Coordinates ---
figure;
h = plot(G, 'XData', XData, 'YData', YData); % PASS THE X/Y DATA HERE

% --- D. Customization for Clarity (ADDED EdgeColor) ---
h.NodeColor = [1 0 0; repmat([0 0.7 0], 5, 1); repmat([0 0 1], 10, 1)]; % Red, Green, Blue
h.NodeLabel = G.Nodes.Name;

% **CRITICAL ADDITION: Explicitly set EdgeColor for visibility**
h.EdgeColor = [0 0 0]; % Set edge color to Black

h.EdgeLabel = round(G.Edges.Weight, 3);
h.LineWidth = abs(G.Edges.Weight) * 2 + 0.1; 
title('Top 10 Countries Network Graph (Ordered Visualization)');

h.EdgeFontSize = 8;