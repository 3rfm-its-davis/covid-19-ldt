---
marp: true
theme: test
---

<!--
_class: title
paginate: true
-->

# The Impact of the COVID-19 Pandemic on Long-distance Travel

## September 9, 2020

## Keita Makino

### Graduate Student Researcher, 3 Revolutions Future Mobility Program

### Institute of Transportation Studies, University of California, Davis

### kemakino@ucdavis.edu

<!--
Hello everyone, this is Keita Makino from 3 Revolutions Future Mobility.

Today I'd like to give a quick review on the changes of long-distance travel due to the COVID-19 pandemic, which Grant has already given the overview about in the first presentation.

-->

---

<!--
class: slides
-->

# Background

- Long-distance (LD) travel has been severely impacted by COVID-19
- Compared to 2019,
  - 86.5% reduction in air travel in early 2020 \*
  - 41.6% reduction in 500+ miles travel in early April \*\*

<div class="footer-multiple">
*: B. Pearce, “COVID-19 June data and revised air travel outlook,” Montreal, Quebec, Canada, 2020.

\*\*: United States Department of Transportation, “Daily Travel during the COVID-19 Pandemic,” Bureau of Transportation Statistics, 2020. [Online]. Available: https://www.bts.gov/daily-travel. [Accessed: 02-Sep-2020].

</div>

<!--
As you may already know, transportation and people's travel behavior are significantly impacted factors by the COVID-19 disruption. Especially, the long-distance travel, LD travel, is the most severely impacted as it'd bring a higher exposure to the public during the travel.

Almost no one was traveling around for a long distance when the pandemic had come. According to IATA, the International Air Transport Association, the total revenue passenger kilometers significantly dropped from the last year by 86.5% in early 2020. The number of trips for more than 500 miles decreased by 41.6% in April 2020, assessed by the U.S. Department of Transportation.
-->

---

# Study Overview

- How has LD travel been impacted by COVID-19?
- Who has been making fewer/more LD trips **during** the pandemic?
- Who will make fewer/more LD trips **after** the pandemic?

<!--
Given these facts, our research questions are listed as this. First of all, certainly, we have investigated how the pandemic impacted the LD-travel behavior.

Next, we made a close look at the underlying factors with which the pandemic affected the "current" behavior of different cohorts in the U.S.

Also, we made a similar analysis in the "future" motivation for the LD travel. In each analysis, the survey participants were classified into three groups: who made, or will make, fewer trips than the previous time frame, the same amount of trips, or more trips.

We adopted a multinomial-logit model with the three levels of the dependent variable.
-->

---

<!--
_class: slides data
-->

# Data and Methods

- Three versions of the survey:
  - Dataset L – “Longitudinal Data” through recall of 2018-2019 respondents
  - Dataset O – “Opinion Panel” in 15 regions in the US and two regions in Canada
  - Dataset C – “Convenience Sample” with outreach through e-mail listservs and online social media ads
- Online survey in Qualtrics.com (open May-July 2020)
- Total sample size of 10,958 (as of July 7th, in the US and Canada)
- More information on postcovid19mobility.ucdavis.edu
- Multinomial-logit model with _active workers in dataset O_

![100%](./us.png)

<div class="footer footer-right">Geographic distribution of US respondents (as of July 7)</div>

<!--
As Grant has introduced in the first presentation, we have launched a series of online surveys from May to July. Three types of datasets, longitudinal, opinion panel, and convenience sample, were collected and in this study we use the opinion panel data.

The survey was hosted online through Qualtrics platform and we collected approximately 11 thousand of the responses. Please visit the website for more details.

In this study, using the dataset O, we applied a multinomial-logit model to evaluate the influential factors that have determined the changes in LD travels.
-->

---

# Model 1 - Current Behavior

Dependent Variable: Change in _work-related_ LD trips during COVID-19

- Three-level dependent variable
  - If traveled more times in 2020, _"more LD trips"_
  - If traveled fewer times in 2020, _"fewer LD trips"_
  - Otherwise, _"same LD trips"_

<!--
The first model we introduce here is the estimation of current LD travel, compared to that of the last year. The dependent variable is three-level behavioral change, either the survey participant has had a fewer, more, or about the same number of LS trips in the COVID-19 pandemic.

Taking the difference of number of trips in 2019 and 2020, if the participant had more LD trips, they were classified into "more" level. If they had fewer trips, fewer. Otherwise same.
-->

---

<!--
_class: slides list
-->

# Explanatory Variables (1) - Socio-demographics

<div>

- Age
  - Generation Z: 1996 or later
  - Millennials: 1981 - 1995
  - Generation X: 1966 - 1980
  - Older: 1965 or earlier
- Gender
  - Male
  - Non-male (female/non-binary)

<span></span>

- Income (USD)
  - Low: \$49,999 or less
  - Medium: $50,000 - $99,999
  - High: \$100,000 or more
- Education
  - Less than bachelor
  - Bachelor or more

</div>

<!--
The explanatory variables used in the model are listed here. The first category is social-demographic factors including: Age with 4 levels; generation z, millennials, generation x and older, Gender with male and non-male that includes the non-binary people, Income, with three levels in the unit of USD, and the education level, less than bachelor or bachelor or more.
-->

---

<!--
_class: slides list
-->

# Explanatory Variables (2) - Others

<div>

- Concern of health impacts of the pandemic in the country \*
- Video conferencing seen as a replacement of LD trips \*
- Presence of child(ren)

<span></span>

- Neighborhood type
  - Urban
  - Non-urban
- Region
  - West
  - Midwest
  - South
  - Northeast

</div>

<div class="footer">*: treated as numeric variable</div>

<!--
Also, we have included two attitudinal variables in the logit model. First is based on the question asking how much was the survey participant worried about the health issues in the country, the United States. The second one is their degree of approval toward the idea that the video conferencing, like this zoom call, would effectively replace some of the LD travel. The response for the two questions was in a Likert scale and we have treated it as a numeric variable.

The other things included in the model were; the presence of children, yes or no, neighborhood type, urban or non-urban, region, US West, Midwest, South, and Northeast.
-->

---

# Model 1 Estimation Results (1)

<div class="header">Base alternative: Fewer LD trips</div>

| Variable                            | Option           | Same LD trips              | More LD trips              |
| ----------------------------------- | ---------------- | -------------------------- | -------------------------- |
| Age (Ref: Generation X)             | Generation Z     |                            | <div class="plus">+</div>  |
|                                     | Millennials      |                            | <div class="plus">+</div>  |
|                                     | Older            |                            | <div class="minus">-</div> |
| Gender (Ref: Male)                  | Non-male         | <div class="plus"></div>   | <div class="minus">-</div> |
| Education (Ref: Less than bachelor) | Bachelor or more | <div class="minus">-</div> | <div class="minus">-</div> |
| Income (Ref: Low)                   | Medium           | <div class="plus">+</div>  | <div class="minus">-</div> |
|                                     | High             |                            | <div class="minus">-</div> |

<!--
Given this, the table here shows the summary of the result. The plus and minus signs here are representing a significant contribution to determining the classification that the person with the corresponding characteristics would belong to. For instance, people in the younger generations, generation z and millennials are more likely to belong to the "more" category, which means that they made more LD travels in 2020.

Here, age, gender, education, income, all of them are somehow identified as a significant factor, especially for distinguishing people traveled less often in 2020 and those who traveled more often, the opposite cohorts.
-->

---

# Model 1 Estimation Results (2)

<div class="header">Base alternative: Fewer LD trips</div>

| Variable                       | Option    | Same LD trips | More LD trips              |
| ------------------------------ | --------- | ------------- | -------------------------- |
| Presence of children (Ref: No) | Yes       |               | <div class="plus">+</div>  |
| Health concern                 | -         |               | <div class="minus">-</div> |
| Video conferencing             | -         |               | <div class="plus">+</div>  |
| Neighborhood (Ref: Urban)      | Non-Urban |               | <div class="minus">-</div> |
| Region (Ref: US West)          | Midwest   |               |                            |
|                                | South     |               |                            |
|                                | Northeast |               |                            |

<!--
In this continuous list, the presence of children, health concern, attitude toward video conferencing as a replacement of LD travels, and the neighborhood type were identified as a significant factor. Interstingly, the region factor was not significant in our first model, which implies, even though the pandemic situation varied across the several U.S. regions, people in the country overall shared the direction of the change in the LD-travel behavior.
-->

---

<!--
_class: slides list2
-->

# Findings from Model 1

- _Younger generations_ tend to travel more
  - They may be in a position that needs more LD trips
- _Non-male workers_ are less likely to travel more
- _Lower-income workers_ tend to have more LD trips in 2020
  - Higher-income workers are more flexible to adjust/cancel their LD travel
  - More educated workers replace LD trips with virtual alternatives
- _Presence of children_ associates with more LD trips
  - This might be a proxy for a later stage in life
- _Workers who live in non-urban areas_ are less likely to make more LD trips in 2020
  - The decline in the work-related trips in such areas

<!--
So here's the summary of the summary. First, younger generations tend to travel more in 2020. This might be because they are in a position in a company which demands them to make LD travels regardless of their health concern or willingness.

Non-males workers are less likely to travel more in 2020.

Lower-income workers are supposed to travel more often in 2020, which could be because of their job type that couldn't be switched to teleworking. Same thing would apply to the educational background. Thus, educated people are likely to have a job or be in a position where they can work from home during the pandemic.

Presence of children is however somehow negating this result by showing a positive sign to "more" category. This means people with children are likely to travel more in 2020. This seems a little weird and may need a further analysis.

Attitude to video conferencing was identified as a positive factor for the more category. This implies that people in favor of replacing LD travels by video calls might be somehow unsatisfied with the current situation where they make a lot of LD travels. So this could be a reversed causality.

Finally, people in a suburban and rural area are less likely to travel more in 2020, potentially just because they don't need to do so.
-->

---

# Model 2 - Future Expectations about Long-Distance Travel

Dependent Variable: Expectation for future _work-related_ LD trips

- Expectation for LD trips frequency in **October 2020**
- Comparing to **now** (when the survey was taken)
- 5-scale options (much less often - much more often) -> 3 levels
- Additional explanatory variables to Model 1
  - Race (white or other)
  - Current practice of remote working (yes or no)

<!--
The next model we like to introduce here is the model for future travel behavior. Survey participants were asked to state their expectation about their frequency of LD trips in a short-term future, October 2020, compared to when the survey was taken. The question had 5-scale options from much less often to much more often and we merged them into 3 levels again, less often, more often or same. Two explanatory variables were added to that of the first model; race and current practice of remote working.
-->

---

# Model 2 Estimation Results (1)

<div class="header">Base alternative: Same Frequency of LD trips</div>

| Variable                            | Option           | Less Often | More Often                 |
| ----------------------------------- | ---------------- | ---------- | -------------------------- |
| Age (Ref: Generation X)             | Generation Z     |            | <div class="plus">+</div>  |
|                                     | Millennials      |            | <div class="plus">+</div>  |
|                                     | Older            |            |                            |
| Gender (Ref: Male)                  | Non-male         |            | <div class="minus">-</div> |
| Education (Ref: Less than bachelor) | Bachelor or more |            | <div class="plus">+</div>  |
| Income (Ref: Low)                   | Medium           |            |                            |
|                                     | High             |            |                            |
| Race (Ref: White)                   | Non-white        |            | <div class="minus">-</div> |

<!--
The result is shown here. Among the social demographic factors, only the income variable was not identified as a significant one. Others are all significant, for example, more educated workers expect to increase their LD travel frequency by October 2020.
-->

---

# Model 2 Estimation Results (1)

<div class="header">Base alternative:  Same Frequency of LD trips</div>

| Variable                       | Option    | Less Often                 | More Often                 |
| ------------------------------ | --------- | -------------------------- | -------------------------- |
| Presence of children (Ref: No) | Yes       | <div class="plus">+</div>  | <div class="plus">+</div>  |
| Health concern                 |           | <div class="plus">+</div>  | <div class="plus">+</div>  |
| Video conferencing             |           |                            | <div class="plus">+</div>  |
| Neighborhood (Ref: Urban)      | Non-Urban |                            | <div class="minus">-</div> |
| Region (Ref: US West)          | Midwest   |                            | <div class="plus">+</div>  |
|                                | South     | <div class="plus">+</div>  | <div class="plus">+</div>  |
|                                | Northeast |                            |                            |
| Remote work (Ref: No)          | Yes       | <div class="minus">-</div> | <div class="plus">+</div>  |

<!--
In this table, all the variables are significant to either or both directions of the change. Note that, because the focus here is the expectation of the LD travels so it does not necessarily reflect the real behavior of the survey participant.
-->

---

# Results (2)

<!--
_class: slides list2
-->

- _Younger generations_ expect to travel more often
  - Older people would be still concerned about health risks
- _Non-male workers_ are less likely to travel more
- _Educated-workers_ would see more LD trips
  - Potentially because most of them are currently remote-working
- _Presence of children_ and
  _People with health concern_ seems to consist of two types of workers
  - One is "optimistic", who believe there will be a good remedy soon
  - The other is "pessimistic", who consider the LD travel will be inactive for long
- _Current remote workers_ expect to start traveling long-distance again soon

<!--
Here's the main findings.  First, despite that younger people are currently traveling more frequently than they did in 2019, they still expect their number of LD trips increased in the short-term future. This could be because of their work position, income or life-stage change or so on. On the other hand, older people than the generation X did not show inclination towards LD trips in the short-term future. This might be because of the health risks around them.

Non-male workers showed a negative sign for the more category, showing that they do not consider their LD travel behavior resume in October 2020.

Educated workers are supposed to remotely work at this point, and most of them seem to expect to resume their LD trips soon.

Presence of children shows and the health concern in the country shows a positive sign to both direction. This could be explained by that there are two types of people among the cohorts. One is those who believe that the situation will get enough better soon to make LD trips. The other is more pessimistic about the future.
-->

---

# Conclusion

<!--
_class: slides list3
-->

- COVID-19 has altered the LD-travel behavior _with heterogeneous effects_
  - At least in the 15 US metropolitan areas investigated in this study
- Younger and low-income workers may have to keep traveling
  - Many workers have gone remote-working _if it's feasible_
  - Most of them anticipate that the behavior is not permanent
  - May need attention regarding an equity perspective
- Substitution effect was not captured in this study
  - While LD-air travel significantly declined, LD-car travel had some resilience
- Longitudinal analysis and/or qualitative interview will complement the study

<!--
Wrapping up the discussion. By using our online survey regarding the change in travel behavior during COVID-19, we have made two analyses with a multinomial logit model. One compares the past and current behavior. The other compares the current behavior and expectation for the future. As a result, we have found out that the impact of COVID-19 is heterogeneous over the different groups of the society. First, younger and low-income workers may have to keep traveling, or even more, during the pandemic, possibly because of their work position, life stage and so on.

On the other hand, people who "can" remote work went remote-working during the pandemic. This cohort includes higher-income and/or older workers for instance. However, those who are remote-working anticipate that the behavior is not permanent and will go back to normal soon. These finding may lead to raising an equity issue in the industry of the long-distance travel and working environments.

Because we have aggregated all the types of work-related LD trips into one category, the substitution effect was not captured in the study. In the real world, while the air travel has significantly declined, LD trips by car have shown some resiliency. To examine the details of the components of those groups, we may need to have a longitudinal study or survey, or qualitative interviews that would reveal the job details, household structures, lifestyles, and so on.
-->

---

<!--
_class: acknowledgments
-->

![](./acknowledgements.png)

---

<!--
_class: slides acknowledgments
-->

# Research work

![bg contain](./paper.png)

<div class="footer">The paper is under review and available upon request.</div>

---

<!--
class: plain
-->

Thank you!

<div>Questions?</div>

<span>
kemakino@ucdavis.edu --- https://github.com/3rfm-its-davis/covid-19-ldt
</span>

![](./kemakino.png)
![](./github.png)
