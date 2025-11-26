
GlobalNode = {'GlobalAnalysis'};
FactorNodes = {'LiteracyRate', 'Funding', 'InternetAccess', ...
               'StudentTeacherRatio', 'YouthUnemployment'};

CountryNodes = {'Venezuela', 'Vanuatu', 'Sweden', 'Belgium', 'Finland', ...
                'Moldova', 'Macau', 'Ukraine', 'Slovenia', 'United States'}; 
AllNodes = [GlobalNode, FactorNodes, CountryNodes];


T_global = readtable('global.csv', 'ReadVariableNames', false, 'HeaderLines', 0);
T_all_countries = readtable('countrywise.csv', 'VariableNamingRule', 'preserve'); 


SourceNodes = {};
TargetNodes = {};
Weights = [];