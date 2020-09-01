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

---

<!--
class: slides
-->

# Study Overview

- How long-distance (LD) travel have been impacted by COVID-19?
- Who makes significantly fewer/more LD trips **during** the pandemic?
- Who will make fewer/more LD trips **after** the pandemic?
- Multinomial-logit model with three classes (fewer/same/more).

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

---

# Dataset (Opinion panel)

- 17 cities in the U.S. and Canada
  - 15 cities in the U.S. have been used
- 7,403 observations in the dataset
- Those who "never traveled" before were removed before analysis
  - N=3,973

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
  - Video conferencing seen as good replacement of LD trips
- Other
  - Presence of child(ren)
  - Neighborhood type (`Urban or non-urban`)
  - Region (`West, Midwest, South, or Northeast`)

---

# Results (1)

| Variable              | Option      | Same     | More           | Variable           | Option    | Same | More           |
| --------------------- | ----------- | -------- | -------------- | ------------------ | --------- | ---- | -------------- |
| Age (Ref: GenX)       | GenZ        |          | &nbsp;&nbsp;➕ | Chd. (Ref: No)     | Yes       |      | &nbsp;&nbsp;➕ |
|                       | Millennials |          | &nbsp;&nbsp;➕ | Health concern     |           |      | &nbsp;&nbsp;➖ |
|                       | Older       |          | &nbsp;&nbsp;➖ | Video conferencing |           |      | &nbsp;&nbsp;➕ |
| Gen. (Ref: Male)      | Non-male    | &nbsp;➕ | &nbsp;&nbsp;➖ | Ngh. (Ref: Urban)  | Non-Urban |      | &nbsp;&nbsp;➖ |
| Edc. (Ref: <Bechelor) | >=Bachelor  | &nbsp;➖ | &nbsp;&nbsp;➖ | Reg. (Ref: West)   | Midwest   |      |                |
| Inc. (Ref: Low)       | Medium      | &nbsp;➕ | &nbsp;&nbsp;➖ |                    | South     |      |                |
|                       | High        |          | &nbsp;&nbsp;➖ |                    | Northeast |      |                |

---

# Results (1)

// some text

---

# Model (2)

Dependent Variable: Expectation for future LD trips

- Expectation for LD trips frequency in **October 2020**
- 5-scale options (much less often - much more often)
- Comparing to **now** (when the survey was taken)
- Same explanatory variables to Model (1)

---

# Results (2)

| Variable              | Option      | Less | More           | Variable              | Option    | Less     | More           |
| --------------------- | ----------- | ---- | -------------- | --------------------- | --------- | -------- | -------------- |
| Age (Ref: GenX)       | GenZ        |      | &nbsp;&nbsp;➕ | Chd. (Ref: No)        | Yes       | &nbsp;➕ | &nbsp;&nbsp;➕ |
|                       | Millennials |      | &nbsp;&nbsp;➕ | Health concern        |           | &nbsp;➕ | &nbsp;&nbsp;➕ |
|                       | Older       |      |                | Video conferencing    |           |          | &nbsp;&nbsp;➕ |
| Gen. (Ref: Male)      | Non-male    |      | &nbsp;&nbsp;➖ | Ngh. (Ref: Urban)     | Non-Urban |          | &nbsp;&nbsp;➖ |
| Edc. (Ref: <Bechelor) | >=Bachelor  |      | &nbsp;&nbsp;➕ | Reg. (Ref: West)      | Midwest   |          | &nbsp;&nbsp;➕ |
| Inc. (Ref: Low)       | Medium      |      |                |                       | South     | &nbsp;➕ | &nbsp;&nbsp;➕ |
|                       | High        |      |                |                       | Northeast |          |                |
| Race (Ref: White)     | Non-white   |      | &nbsp;&nbsp;➖ | Remote work (Ref: No) | Yes       | &nbsp;➖ | &nbsp;&nbsp;➕ |

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
