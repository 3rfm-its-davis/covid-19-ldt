---
marp: true
theme: test
---

<!--
_class: title
-->

# The Impact of the COVID-19 Pandemic on Long-distance Travel

## September 9, 2020

## Keita Makino

### 3 Revolutions Future Mobility Program

### Institute of Transportation Studies, University of California, Davis

<!--
Hello everyone, this is Keita Makino from 3 Revolutions Future Mobility.

Today I'd like to give a quick review on the changes of long-distance travels due to the COVID-19 pandemic, which Grant has already given the overview about in the first presentation.

-->

---

<!--
class: slides
-->

# Background

- Long-distance (LD) travel is most severely impacted by COVID-19
- Compared to 2019,
  - 86.5% reduction in air travel in early 2020 \*
  - 41.6% reduction in 500+ miles travel in early April \*\*

<div class="footer">
*: B. Pearce, “COVID-19 June data and revised air travel outlook,” Montreal, Quebec, Canada, 2020.

\*\*: United States Department of Transportation, “Daily Travel during the COVID-19 Pandemic,” Bureau of Transportation Statistics, 2020. [Online]. Available: https://www.bts.gov/daily-travel. [Accessed: 02-Sep-2020].

</div>

<!--
As you may already know, transportation and people's travel behavior are significantly impacted factors by the COVID-19 disruption. Especially, the long-distance travel, LD travel, is the most severely impacted as it'd bring a higher exposure to the public during the travel.

Almost no one was traveling around for a long distance when the pandemic had come. According to IATA, the International Air Transport Association, the total revenue passenger kilometers significantly dropped from the last year by 86.5% in early 2020. The number of trips for more than 500 miles decreased by 41.6% in April 2020, assessed by the U.S. Department of Transportation.
-->

---

# Study Overview

- How LD travel has been impacted by COVID-19?
- Who makes significantly fewer/more LD trips **during** the pandemic?
- Who will make fewer/more LD trips **after** the pandemic?
- Multinomial-logit model with three classes (fewer/same/more).

<!--
Given these facts, our research questions are listed as this. First of all, certainly, we have investigated how the pandemic impacted the LD-travel behavior.

Next, we made a close look at the underlying factors with which the pandemic affected the "current" behavior of different cohorts in the U.S.

Also, we made a similar analysis in the "future" motivation for the LD travel. In each analysis, the survey participants were classified into three groups: who made, or will make, fewer trips than the previous time frame, the same amount of trips, or more trips.

We adopted a multinomial-logit model with the three levels of the dependent variable.
-->

---

# Dataset

- Online survey on travel behavior before/during COVID-19
  - General travel pattern
  - E-shopping
  - Use of technologies
- Three distribution channels
  - Longitudinal
  - Opinion panel \*
  - Convenient sampling

<!--
As
-->

---

# Dataset (Opinion panel)

- 17 cities in the U.S. and Canada
  - 15 cities in the U.S. have been used
- 7,403 observations in the dataset
- Those who "never traveled" before were removed before analysis
  - N=3,973 for the further sections

---

# Model (1)

Dependent Variable: Change in LD travel frequency during COVID-19

$$
y'=LDT_{(2019)} / 6 - LDT_{(2020)} \\

y= \begin{cases}
\text{"fewer" if }y' > 0.5 \\
\text{"more" if }y' < -0.5 \\
\text{"same" otherwise}
\end{cases}
$$

- Base alternative: Fewer number of LD trips during COVID-19

---

# Model (1)

![bg 60%](./histogram.png)

---

# Explanatory Variables (1)

- Socio-demographics
  - Age (`GenZ, millennials, GenX, or older`)
  - Gender (`Male or non-male`)
  - Income (`Low:<50,000, Medium:50,000-99,999, High:<=100,000`)
  - Education (`<Bachelor or >=Bachelor`)

---

# Explanatory Variables (2)

- Attitudinal factors
  - Concern about health impacts of the pandemic in the country
  - Video conferencing seen as a replacement of LD trips
- Other
  - Presence of child(ren)
  - Neighborhood type (`Urban or non-urban`)
  - Region (`West, Midwest, South, or Northeast`)

---

# Results (1)

| Variable              | Option      | Same                       | More                       | Variable           | Option    | Same | More                       |
| --------------------- | ----------- | -------------------------- | -------------------------- | ------------------ | --------- | ---- | -------------------------- |
| Age (Ref: GenX)       | GenZ        |                            | <div class="plus">+</div>  | Chd. (Ref: No)     | Yes       |      | <div class="plus">+</div>  |
|                       | Millennials |                            | <div class="plus">+</div>  | Health concern     |           |      | <div class="minus">-</div> |
|                       | Older       |                            | <div class="minus">-</div> | Video conferencing |           |      | <div class="plus">+</div>  |
| Gen. (Ref: Male)      | Non-male    | <div class="plus"></div>   | <div class="minus">-</div> | Ngh. (Ref: Urban)  | Non-Urban |      | <div class="minus">-</div> |
| Edc. (Ref: <Bechelor) | >=Bachelor  | <div class="minus">-</div> | <div class="minus">-</div> | Reg. (Ref: West)   | Midwest   |      |                            |
| Inc. (Ref: Low)       | Medium      | <div class="plus">+</div>  | <div class="minus">-</div> |                    | South     |      |                            |
|                       | High        |                            | <div class="minus">-</div> |                    | Northeast |      |                            |

---

# Results (1)

- _Younger generations_ tend to travel more
- _Non-male workers_ are less likely to travel more
- _Lower-income_ implies more travels
- _Presence of children_ associates with more travels
- _Attitude to video-conferencing_ may reflect LD travel behavior
- _Non-urban habitats_ would not travel more

---

# Model (2)

Dependent Variable: Expectation for future LD trips

- Expectation for LD trips frequency in **October 2020**
- 5-scale options (much less often - much more often)
- Comparing to **now** (when the survey was taken)
- Additional explanatory variables to Model (1)
  - Race
  - Current practice of remote working

---

# Results (2)

| Variable              | Option      | Less | More                       | Variable              | Option    | Less                       | More                       |
| --------------------- | ----------- | ---- | -------------------------- | --------------------- | --------- | -------------------------- | -------------------------- |
| Age (Ref: GenX)       | GenZ        |      | <div class="plus">+</div>  | Chd. (Ref: No)        | Yes       | <div class="plus">+</div>  | <div class="plus">+</div>  |
|                       | Millennials |      | <div class="plus">+</div>  | Health concern        |           | <div class="plus">+</div>  | <div class="plus">+</div>  |
|                       | Older       |      |                            | Video conferencing    |           |                            | <div class="plus">+</div>  |
| Gen. (Ref: Male)      | Non-male    |      | <div class="minus">-</div> | Ngh. (Ref: Urban)     | Non-Urban |                            | <div class="minus">-</div> |
| Edc. (Ref: <Bechelor) | >=Bachelor  |      | <div class="plus">+</div>  | Reg. (Ref: West)      | Midwest   |                            | <div class="plus">+</div>  |
| Inc. (Ref: Low)       | Medium      |      |                            |                       | South     | <div class="plus">+</div>  | <div class="plus">+</div>  |
|                       | High        |      |                            |                       | Northeast |                            |                            |
| Race (Ref: White)     | Non-white   |      | <div class="minus">-</div> | Remote work (Ref: No) | Yes       | <div class="minus">-</div> | <div class="plus">+</div>  |

---

# Results (2)

// some text

---

# Conclusion

// some text

---

<!--
_class: plain
-->

Thank you!
