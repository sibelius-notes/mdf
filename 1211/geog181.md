---
title: GEOG 181 - Designing Effective Maps
layout: toc
parent: Winter 2021
prof: Weikai Tan
---
# Week 1
do asst 1

# Week 2
do asst 1

# Week 7: Mapping Quantitative Data

## Describing Spatial Data
**Level of measurement**: whether data is collected at a nominal, ordinal, interval, or ratio level
- **Nominal**: or categorical. Only named, but no relationship to other categories.
- **Ordinal**: can be ordered or ranked.
- **Interval**: the distance between values is meaningful. From [questionpro](https://www.questionpro.com/blog/interval-data/): "Interval data, also called an integer, is defined as a data type which is measured along a scale, in which each point is placed at equal distance from one another."
- **Ratio**: a quantified difference between values with an absolute zero point. An example from [small arms survey](http://www.smallarmssurvey.org/gbav).


# Week 8: Choropleth Maps and Classification
Choropleth maps use a sequence of colour shades to represent categories of data for a given area of geography.

## Overview of Choropleth Mapping
A choropleth map represents data not as individual points (such as the graduated symbol map), but aggregated to a given spatial unit, such as a municipality, census division, province, state, or nation.

In class, we examine [How long will YOU live?](https://www.dailymail.co.uk/news/article-2240855/How-does-nation-rank-world-map-life-expectancy.html): Figure 1 is the table in typical format. Then [How does your nation rank?](https://io9.gizmodo.com/a-world-map-of-average-life-expectancy-by-country-how-5964093): Figure 2 is a world map. The color and classification in this map allow the reader have a better visualization.

Recall in week 7: *Level of measurement*: nominal, ordinal, interval, or ratio level. So for different types of data, we use different colour scheme. Three main colour schemes are:
- **Qualitative**: nominal level.
- **Sequential**: ordinal, interval, or ratio levels. Sequential categories.
- **Diverging**: ordinal, interval, or ratio levels. Sequential categories. Two different colour hues, to represent values around a midpoint.

Nominal data (qualitative or categorical data) can’t be represented using a sequential colour scheme!

## Selecting a Data Classification Method
The purpose of classification is to simplify data through creating groupings of similar data points.

**Number of Classes**: Convention is to have more than 3 classes, but typically not more than 7.

**Classification Method**
- **unclassified data**: represents each data value as a distinct colour
- **equal interval method**:  data is divided up into "buckets" of equal size
- **quantile (equal count) classification method**: how the data is actually distributed before constructing class boundaries.
- **natural breaks classification method**: arranges class limits to correspond with breaks or low points in the data distribution. The goal: maximize diff between classes, while minimizing diff within a class.
- **unique values classification**: the map maker based on some external criteria

**Limitations of Choropleth Maps**: Appropriate classification, Choice of geographic unit of analysis, Comparing sizes of units, Using choropleth techniques improperly.
