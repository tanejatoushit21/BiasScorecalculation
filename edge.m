% --- INITIAL SETUP (Required for Robustness) ---
% WARNING: If the code still errors, you MUST verify the exact name of the
% 'BiasScore_1to10' column in your T_all_countries table.
% Use: T_all_countries.Properties.VariableNames in your MATLAB command window.

BiasScoreColumnName = 'BiasScore_1to10'; 

% Define Factor Columns by name for robustness (based on countrywise.csv header)
FactorDataColumns = {'LiteracyRate', 'Funding', 'InternetAccess', 'StudentteacherRatio', 'Unemployement'};

% Initialize nodes and weights (must be cell arrays/vectors before concatenation)
if ~exist('SourceNodes', 'var') || isempty(SourceNodes)
    SourceNodes = {}; TargetNodes = {}; Weights = [];
end


% --- A. Edge Type 1: Factor -> Global (from T_global) ---
% Assuming T_global{:, 1} are Factor Names and T_global{:, 2} are Weights
SourceNodes = [SourceNodes, T_global{:, 1}'];
TargetNodes = [TargetNodes, repmat(GlobalNode, 1, size(T_global, 1))];
Weights = [Weights, T_global{:, 2}'];


% --- B. FILTERING: Sort and Select Top 10 Rows ---
% FIX: Using the defined variable name (must match your table's properties)
T_country_sorted = sortrows(T_all_countries, BiasScoreColumnName, 'ascend');
T_country = T_country_sorted(1:10, :); % T_country now holds only the Top 10 rows


% --- C. Edge Type 2: Country -> Factor (from filtered T_country) ---
FactorNames_List = T_global{:, 1}'; % Factor names from T_global

for i = 1:size(T_country, 1) % Loop through the 10 filtered countries
    CountryName = T_country.Country{i};
    
    % FIX: Access data using column names (more robust than indices [4, 5, 6, 7, 8])
    CountryData = T_country{i, FactorDataColumns}; 
    
    for j = 1:length(FactorNames_List)
        SourceNodes{end + 1} = CountryName;
        TargetNodes{end + 1} = FactorNames_List{j};
        Weights(end + 1) = CountryData(j);
    end
end