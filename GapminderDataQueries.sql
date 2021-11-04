/* View all the data */
Select *
From  PortfolioProject..GapminderData

/* --------------------------------------------- Check for missing/null values ----------------------------------------------------*/

/* NULL values */
Select *
From PortfolioProject..GapminderData
Where Country is null or Continent is null or Year is null or LifeExp is null or Population is null or [GDP/Cap] is null

/* Blank Values */
Select *
From PortfolioProject..GapminderData
Where LEN(Country) >0 or LEN(Continent) >0 or LEN(Year) >0 or LEN(LifeExp) >0 or LEN(Population) >0 or LEN([GDP/Cap]) >0


/* --------------------------------------------- Split Americas Continent into North & South America --------------------------------------------- */

Update PortfolioProject..GapminderData
Set Continent = 'North America'
Where Country = 'United States' or Country = 'Canada' or Country = 'Mexico' or Country = 'Haiti' or Country = 'Jamaica' or Country = 'Costa Rica' 
			or Country = 'Cuba' or Country = 'Dominican Republic' or Country = 'Guatemala' or Country = 'Honduras' or Country = 'Panama'
			or Country = 'El Salvador' or Country = 'Nicaragua' or Country = 'Puerto Rico'

Update PortfolioProject..GapminderData
Set Continent = 'South America'
Where Country = 'Argentina'  or Country = 'Bolivia' or Country = 'Brazil' or Country = 'Chile' or Country = 'Colombia' or Country = 'Ecuador' 
			or Country = 'Paraguay' or Country = 'Peru' or Country = 'Trinidad and Tobago' or Country = 'Uruguay' or Country = 'Venezuela'


/* --------------------------------------------- Select subset of the data for years 1952, 1982, 2007 --------------------------------------------- */

/* Avg Life Expectancy,  GDP/Cap for each continent in 1952 */
Select Continent, ROUND(AVG(LifeExp), 2) as 'Avg. Life Expectancy', ROUND(AVG([GDP/Cap]), 2) as AvgGDP
From PortfolioProject..GapminderData
Where Year = '1952'
Group by Continent

/* Avg Life Expectancy for each continent in 1982 */
Select Continent, ROUND(AVG(LifeExp), 2) as 'Avg. Life Expectancy', ROUND(AVG([GDP/Cap]), 2) as AvgGDP
From PortfolioProject..GapminderData
Where Year = '1982'
Group by Continent

/* Avg Life Expectancy for each continent in 2007 */
Select Continent, ROUND(AVG(LifeExp), 2) as 'Avg. Life Expectancy', ROUND(AVG([GDP/Cap]), 2) as AvgGDP
From PortfolioProject..GapminderData
Where Year = '2007'
Group by Continent

/* --------------------------------------------- Avg. Population Changes 1952-2007 --------------------------------------------- */

Select Continent, Year, ROUND(AVG(Population), 2) as AvgPop
From PortfolioProject..GapminderData
Where Year = '1952' or Year = '2007'
Group by Year, Continent

/* --------------------------------------------- Comparison Between UK and USA --------------------------------------------- */

Select Country, Year, ROUND(LifeExp, 2) as LifeExp, Population, ROUND([GDP/Cap], 2) as [GDP/Cap]
From PortfolioProject..GapminderData
Where (Year = '1952' or Year = '2007') and (Country = 'United Kingdom' or Country = 'United States')

