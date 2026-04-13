---
title: "HLTH 333: Epidemiology"
prof: "Mark Oremus"
subjects: "HLTH"
---

## Sources and References

**Primary textbook** — Leon Gordis, *Epidemiology*, 6th ed. (Elsevier).
**Supplementary texts** — Ann Aschengrau, George R. Seage *Essentials of Epidemiology in Public Health*; Kenneth J. Rothman *Epidemiology: An Introduction*; Rothman, Greenland, Lash *Modern Epidemiology*; Szklo & Nieto *Epidemiology: Beyond the Basics*; Sackett et al. *Evidence-Based Medicine*; Miguel Hernán & James Robins *Causal Inference: What If*.
**Online resources** — PRISMA 2020 statement (Page et al., BMJ 2021); Johns Hopkins Bloomberg School of Public Health open courseware; Harvard T.H. Chan School of Public Health epidemiology open materials; CDC epidemiology resources.

## Chapter 1 — What Is Epidemiology?

Epidemiology is the study of how health and disease are distributed across populations and of the factors that shape that distribution. The word is Greek in origin — *epi* (upon), *demos* (people), *logos* (study) — literally, the study of what befalls a population. While clinical medicine concerns itself with the individual patient, epidemiology steps back and asks why some groups fall sick while others remain well, how often disease occurs, and what can be done about it. John Last's *Dictionary of Epidemiology* frames the field as the study of the distribution and determinants of health-related states in specified populations, and the application of this study to the control of health problems.

Two words carry most of the weight. *Distribution* points toward descriptive epidemiology — counting cases, watching how rates differ by person, place, and time. *Determinants* points toward analytic epidemiology — asking which exposures actually cause which outcomes, how strongly, and through what pathways. The whole enterprise is ultimately practical: measurement and causal reasoning exist so public health can intervene.

The discipline's most enduring founding story is John Snow's work on the 1854 cholera outbreak in Soho, London. Snow mapped cases and traced the cluster of deaths to a single public water pump. Against the prevailing miasma theory, he used the distribution of illness itself to argue that cholera was waterborne. Earlier figures matter too: James Lind's 1747 scurvy experiment, Ignaz Semmelweis on handwashing and puerperal fever, William Farr on vital statistics. In the twentieth century, the British Doctors' Study by Richard Doll and Austin Bradford Hill established the causal link between smoking and lung cancer and turned prospective cohort design into the workhorse of chronic disease epidemiology.

Modern epidemiology spans an enormous landscape — infectious disease, chronic disease, social and psychiatric, environmental and occupational, pharmacoepidemiology, nutritional, genetic, molecular, and digital epidemiology — a discipline constantly absorbing new data sources.

Two conceptual framings are worth naming early. The first is Gordon's classification of prevention. *Primary prevention* acts before disease onset to remove causes or build resistance (immunization, tobacco control, seatbelt laws). *Secondary prevention* acts during the presymptomatic phase, detecting and treating disease early (cancer screening, blood pressure checks). *Tertiary prevention* acts after disease is established to limit disability and restore function (cardiac rehabilitation, diabetes foot care). A parallel scheme distinguishes universal, selective, and indicated prevention by level of risk in the target group.

The second is the life course approach developed by Ben-Shlomo and Kuh. Rather than treating adult disease as a product of adult exposures alone, life course thinking asks how biological and social experiences across the whole lifespan accumulate and interact to shape adult health. *Critical period* models say an exposure acts during a specific developmental window (intrauterine growth restriction programming later cardiovascular risk) and its effect may lie dormant for decades. *Accumulation* models say damage piles up with repeated or sustained exposures (pack-years of smoking, years of poverty). Chain-of-risk models combine the two. Life course thinking reshapes prevention because it points to upstream, early-life opportunities that a purely adult-focused strategy would miss.

## Chapter 2 — Descriptive Measures: Prevalence, Incidence, and Rates

Before asking *why*, epidemiology asks *how much*. Counts alone are not enough — ten cases among ten people is very different from ten cases among ten thousand — so disease frequency is always expressed as the number of cases divided by the population at risk. The two most important frequency measures are prevalence and incidence, and they answer quite different questions.

*Prevalence* is the proportion of a population that has the disease at a particular moment (or over a specified short interval). It is a snapshot: of everyone alive today, how many are currently living with diabetes, depression, or HIV? Formally,

\[ \text{Prevalence} = \frac{\text{Number of existing cases}}{\text{Total population}} \]

Because prevalence counts both new and long-standing cases, it mingles disease occurrence with disease duration. Anything that keeps people alive with a condition — better treatment, longer survival — pushes prevalence up even if no new cases are appearing. Prevalence is therefore the right measure for planning services (how many hospital beds, how many dialysis chairs, how many insulin prescriptions) but a misleading measure for studying causes.

*Incidence* captures new events. Cumulative incidence, sometimes called the incidence proportion or risk, is the proportion of an initially disease-free group that develops the disease over a defined follow-up period:

\[ \text{Cumulative Incidence} = \frac{\text{Number of new cases during the period}}{\text{Number at risk at the start of the period}} \]

A cumulative incidence of 0.05 over five years means five per cent of the cohort developed the disease in that window. Cumulative incidence is intuitive but assumes everyone is followed for the same length of time, which rarely holds. People drop out, die of other causes, or enter the study late.

To handle variable follow-up, epidemiologists turn to the *incidence rate* (or incidence density), where the denominator is not persons but person-time — the sum of time each individual spent at risk:

\[ \text{Incidence Rate} = \frac{\text{Number of new cases}}{\text{Total person-time at risk}} \]

If 50 new cases of a disease occur during 10,000 person-years of follow-up, the incidence rate is 50/10,000 = 0.005 per person-year, or 5 per 1,000 person-years. Person-time is accumulated individually — someone contributing three years before developing disease contributes three person-years and then leaves the denominator. Rates have units of 1/time; they can exceed 1 in theory (though rarely in practice) and they are the natural currency for comparing disease speeds across groups.

Incidence and prevalence are linked by a simple approximation. In a stable population where neither disease nor population size is changing rapidly, prevalence is roughly the product of incidence rate and average disease duration:

\[ P \approx I \times \bar{D} \]

This captures why a disease with low incidence and long duration (for example, multiple sclerosis) can have much higher prevalence than a disease with high incidence and short duration (for example, a typical cold).

Terminology matters. A *ratio* is any quantity divided by another (male-to-female case ratio, 3:1). A *proportion* is a ratio in which the numerator is part of the denominator (cases / total population). A *rate* in the strictest sense involves time in the denominator. In everyday usage epidemiologists are not always strict — people speak of attack rates and case-fatality rates that are really proportions — but understanding the distinction helps when comparing measures.

Several specialised mortality and morbidity measures appear routinely in public health reports. The *crude mortality rate* is the number of deaths in a population over a time period divided by the total population. The *cause-specific mortality rate* restricts the numerator to deaths from a particular cause. The *case-fatality rate* (actually a proportion) is the fraction of people diagnosed with a disease who die from it within a defined time. *Infant mortality* is deaths before age one per 1,000 live births; *neonatal mortality* covers the first 28 days; *maternal mortality* is pregnancy-related deaths per 100,000 live births. *Attack rates* are used in outbreak settings and represent cumulative incidence within a defined at-risk group over a short period — for example, the proportion of wedding guests who fell ill after a shared meal.

## Chapter 3 — Age Standardization and Comparing Populations

When you compare crude disease rates between two populations, differences in age structure can easily swamp differences in underlying risk. Most chronic diseases are strongly age-dependent — the risk of heart attack, stroke, and many cancers rises steeply with age — so an older population will show higher crude mortality than a younger one even if the age-specific risks are identical. Retirement communities and university towns are an extreme example, but the same problem arises whenever you compare countries, provinces, or years.

*Standardization* fixes the problem by removing the effect of a differing age distribution. Two approaches exist. *Direct standardization* applies each population's age-specific rates to a common standard population, producing a weighted average that answers the question: what would the overall rate be if each population had the same age structure? The age-standardized rate is

\[ \text{ASR} = \frac{\sum_i w_i \cdot r_i}{\sum_i w_i} \]

where \( r_i \) is the age-specific rate in age stratum \( i \) and \( w_i \) is the weight — the number of people in stratum \( i \) — from the chosen standard population. Commonly used standards include the WHO World Standard, the European Standard Population, and the US 2000 Standard. As long as both populations are compared to the same standard, their age-standardized rates can legitimately be set side by side.

*Indirect standardization* goes the other way. It takes age-specific rates from the standard population and applies them to the age structure of the study population, producing an expected number of cases. The ratio of observed to expected events is the *standardized mortality ratio* (SMR):

\[ \text{SMR} = \frac{\text{Observed deaths}}{\text{Expected deaths}} \times 100 \]

An SMR of 150 says the population experienced 50 per cent more deaths than expected given its age structure and the standard rates; an SMR of 80 says 20 per cent fewer. Indirect standardization is especially useful when age-specific rates in the study population are unstable — small numbers within strata — but the total event count is reliable. It is the usual choice for occupational cohort studies, where a group of workers is compared to the general population.

Standardization is not limited to age. Rates can be standardized for sex, race, calendar year, smoking status, or any categorical variable, alone or in combination. The general rule is always the same: choose a standard, reweight so both populations share it, and compare.

## Chapter 4 — Study Designs: An Overview

Study designs in epidemiology sort themselves into two families. *Experimental* studies — randomized controlled trials and their close relatives — are defined by the fact that the investigator assigns the exposure or intervention. *Observational* studies leave exposure up to nature, the individual, or the social world, and the investigator merely watches and measures. Experiments, when feasible and ethical, deliver the cleanest causal inference because randomization balances both known and unknown confounders across treatment groups. Observational designs are indispensable where experiments are impossible (you cannot randomize people to smoke) or unethical (you cannot randomize pregnant women to alcohol), and with careful analysis they can still yield strong causal evidence.

Within observational designs, four broad types dominate. *Cross-sectional studies* measure exposure and outcome at the same point in time in a sample of a population and are the design of choice for estimating prevalence. *Case-control studies* sample on the outcome: a group of people with the disease is compared to a group without, and the histories of the two groups are compared for differences in exposure. *Cohort studies* sample on the exposure: a group of people with varying exposure profiles is followed forward in time, and incident cases of disease are tallied in each exposure stratum. *Ecological studies* use aggregated data — rates or averages at the country, state, or neighbourhood level — rather than individual-level observations.

A further axis is time. *Prospective* studies collect data going forward from enrolment: participants are recruited now and followed into the future. *Retrospective* studies look backward: exposure and outcome have already occurred by the time the study begins, and the investigator reconstructs them from records or memory. Each axis — experimental versus observational, sampling on exposure versus outcome, prospective versus retrospective — can be combined in different ways, producing a menu of designs that will be unpacked in the next several chapters.

## Chapter 5 — Cross-Sectional Studies

A cross-sectional study measures exposure and outcome in the same individuals at essentially the same time. The classic example is a national health survey: thousands of randomly sampled adults answer questions about diet, exercise, and smoking and simultaneously undergo a physical examination and blood draw. From the resulting dataset one can estimate the prevalence of diabetes, the prevalence of smoking, and the association between smoking status and diabetes — all from a single snapshot.

Cross-sectional designs have a number of attractive features. They are usually cheaper and faster than longitudinal studies. They generate prevalence estimates directly and are the backbone of public health surveillance. Multiple diseases and exposures can be studied simultaneously within the same sample. The main limitation is that a snapshot cannot easily establish temporal sequence. If a survey finds that people with depression are also more physically inactive, you cannot tell from that single measurement whether depression led to inactivity, inactivity led to depression, or a third factor drove both. This *temporality* problem is especially dangerous for chronic diseases whose onset is slow and whose duration is long.

A second problem is *prevalence-incidence bias*. Because cross-sectional studies capture prevalent (existing) cases, they oversample people with long-surviving disease and undersample those who died quickly or recovered. If an exposure is associated with disease severity or survival — as many are — the observed exposure-disease association will be distorted. A cross-sectional study of lung cancer patients will disproportionately reflect the experience of those who lived long enough to be surveyed.

Despite these limitations, cross-sectional data are vital. They power national surveys such as NHANES in the United States and the Canadian Community Health Survey, underpin global burden of disease estimates, and provide the denominator information (population characteristics) that other designs rely on.

## Chapter 6 — Case-Control Studies

When a disease is rare, a cohort study is inefficient — you would need to follow enormous numbers of people to observe enough cases to analyze. The case-control design solves this by working backwards. You start by identifying a group of *cases* who already have the disease and a comparable group of *controls* who do not, and then you compare their past exposures. Because you sample on outcome status, case-control studies are efficient for rare diseases and for conditions with long induction times.

Case selection should aim at a well-defined, clinically accurate group of people with the disease of interest. Incident cases (new diagnoses) are usually preferred to prevalent cases to avoid prevalence-incidence bias. Cases may be drawn from hospitals, disease registries, or population-based surveillance. Control selection is the hardest part of the design. The guiding principle, sometimes called the *study base principle*, is that controls should be sampled from the same source population that generated the cases — ideally, the population whose members would have become cases had they developed the disease. Common control sources include population rosters, neighbours, friends, hospital patients with unrelated conditions, and random-digit dialling samples. Each source carries its own risk of bias.

Matching is often used: each case is paired with one or more controls who share characteristics such as age, sex, or neighbourhood. Matching improves efficiency and controls confounding by the matched variables, but it also requires matched analysis (conditional logistic regression, McNemar's test) and prevents you from studying the effect of the matching variables themselves.

Because participants are sampled conditional on disease status rather than exposure status, case-control studies cannot directly estimate incidence or relative risk. They yield the *odds ratio*, which under the rare-disease assumption approximates the risk ratio. In a standard two-by-two table with cases/controls in rows and exposed/unexposed in columns, the odds ratio is

\[ \text{OR} = \frac{a \cdot d}{b \cdot c} \]

where \( a \) is exposed cases, \( b \) is unexposed cases, \( c \) is exposed controls, and \( d \) is unexposed controls. An OR of 2.0 means the odds of exposure among cases is twice the odds among controls — and, approximately, that exposure is associated with a doubling of disease risk.

Case-control designs are efficient and flexible but are particularly vulnerable to *recall bias* (cases remember past exposures more accurately or more selectively than controls) and *selection bias* (cases and controls do not come from the same source population). Careful design and transparent reporting are essential.

## Chapter 7 — Cohort Studies

A cohort study starts with a defined group of people who are all initially free of the outcome of interest, classifies them according to exposure status, and follows them forward in time to see who develops disease. The design mirrors the natural temporal order of cause and effect, which makes it the strongest observational design for causal inference.

Cohorts come in two temporal flavours. In a *prospective cohort study*, the investigator assembles the cohort today and follows it into the future. The Framingham Heart Study (begun in 1948), the British Doctors' Study (1951), the Nurses' Health Study (1976), and the UK Biobank (2006–2010) are iconic examples. In a *retrospective cohort study* (sometimes called a historical cohort), the cohort is reconstructed from existing records — employment files, occupational exposure logs, birth registries — and the follow-up through to the outcome has already happened by the time the investigator arrives. Retrospective cohorts are much cheaper and faster than prospective ones, at the cost of depending on whatever data already exist.

From cohort data you can directly estimate incidence (cumulative incidence or incidence rate) in exposed and unexposed groups, and from there a suite of relative and absolute measures of effect: risk ratios, rate ratios, risk differences, rate differences, attributable fractions. Cohort studies handle multiple outcomes from a single exposure classification elegantly — you can look at the same group of smokers for lung cancer, heart disease, and chronic obstructive pulmonary disease in parallel.

Their weaknesses are equally clear. Cohorts are expensive, logistically demanding, and often take decades. Loss to follow-up is a chronic threat: if people who drop out differ systematically from those who remain, the estimates are biased. Rare diseases yield too few cases to study efficiently, and for very long induction times (decades between exposure and outcome), a prospective cohort may outlast the investigators who began it. These are among the reasons case-control and hybrid designs exist.

## Chapter 8 — Advanced Cohort Designs

Within a large cohort, fully analyzing every participant for every outcome is often unnecessary and sometimes impossible — for example, when exposure requires expensive assays on stored biological samples. Several *nested* designs squeeze case-control efficiency out of cohort data without abandoning the cohort's temporal structure.

A *nested case-control study* starts with a defined cohort. During follow-up, incident cases of the disease are identified. For each case, a small number of controls (matched or not) are sampled from the cohort members still at risk at the time the case developed disease — a sampling scheme called *risk-set sampling* or *incidence-density sampling*. Exposure information (say, a blood assay) is then retrieved only for the cases and their controls, rather than for the entire cohort. Because controls are drawn from the same at-risk population that gave rise to the cases and matched on time, the resulting odds ratio estimates the incidence rate ratio directly, without requiring the rare-disease assumption.

A *case-cohort study* takes a different approach. Instead of sampling new controls at each event time, it selects a random *subcohort* from the original cohort at baseline. All incident cases in the full cohort are analyzed, along with the subcohort, which serves as a comparison group for multiple outcomes. The same subcohort can be reused for many case definitions, making case-cohort designs efficient when several outcomes are of interest.

A *retrospective cohort* design, as noted earlier, reconstructs exposure and outcome from historical records. Occupational studies — for example, examining cancer in workers exposed to asbestos — are often retrospective cohorts, because employment records provide exposure data and death registries provide outcomes going back decades.

The *case-crossover design* takes the logic further. Here each case acts as its own control. For a transient exposure that is hypothesized to trigger an acute event (caffeine intake and atrial fibrillation, heavy physical exertion and myocardial infarction), the investigator compares the exposure in a "hazard period" immediately before the event to exposures in "control periods" at other times. Because the same person provides both exposure and control information, all stable confounders — genotype, chronic health conditions, personality, neighbourhood — cancel out automatically. Case-crossover is best for short-term triggers with abrupt onsets; it cannot be used for chronic exposures. Redelmeier and Tibshirani's landmark analysis of cellular telephone use and motor vehicle collisions is a classic application: drivers who had a crash were compared to themselves at matched earlier times, revealing a roughly fourfold increase in crash risk during phone calls.

## Chapter 9 — Randomized Controlled Trials

A randomized controlled trial (RCT) takes epidemiology's cleanest question — does this exposure cause that outcome? — and brings it under investigator control. Eligible participants are randomly assigned to receive one intervention or another, and the outcomes are compared. Randomization is the defining feature: it balances, in expectation, all characteristics of participants (both those we measure and those we don't) between arms, so any difference in outcome can be attributed to the assigned intervention. Other design elements — blinding, allocation concealment, intention-to-treat analysis — preserve that balance through the conduct of the study.

Historians such as Bothwell and Podolsky have traced how the RCT became the regulatory gold standard. The 1948 Medical Research Council streptomycin trial for pulmonary tuberculosis, designed by Austin Bradford Hill, is often cited as the first properly randomized clinical trial. Subsequent decades saw RCTs move from curiosity to expectation: regulators, guideline bodies, and evidence-based medicine all came to treat the RCT as the default way to establish efficacy.

Key design elements make an RCT trustworthy. *Randomization* should use a transparent method — simple random, permuted blocks, stratified, or minimization. *Allocation concealment* keeps the next assignment hidden from enrollers so selection cannot sneak in. *Blinding* keeps participants, investigators, outcome assessors, and analysts unaware of treatment assignment where possible. *Intention-to-treat analysis* analyzes participants according to the group to which they were randomized, regardless of what they actually received, preserving the benefits of randomization even under non-compliance and dropout. *Per-protocol analysis* is a useful sensitivity check but should not be primary. Kabisch and colleagues dissect trial design and underline the importance of pre-registration, reporting standards (CONSORT), and transparency.

Trial designs come in several flavours. *Parallel-group* trials are the default. *Crossover* trials give every participant every treatment in random order with washout periods — efficient for chronic, stable conditions but vulnerable to carryover. *Cluster-randomized* trials randomize groups (schools, clinics, villages) rather than individuals when the intervention is delivered at group level or when individual randomization would invite contamination. *Factorial* trials randomize each participant to more than one intervention simultaneously. *Pragmatic* trials prioritise generalisability to real-world practice; *explanatory* trials prioritise internal validity.

Ethical constraints shape what can be trialled. The principle of *equipoise* — genuine professional uncertainty about which treatment is better — is the moral precondition for randomization. Trials require informed consent, ethics review, and data and safety monitoring. Not every causal question can be put to a trial, which is why observational epidemiology remains indispensable.

## Chapter 10 — Measures of Association

Once you have incidence in exposed and unexposed groups, comparing them yields the *measure of association* — a number that summarises how strongly exposure and outcome are linked. Measures of association come in two flavours: relative (ratios) and absolute (differences). They answer complementary questions and both are worth reporting.

Consider a two-by-two table:

|                | Diseased | Non-diseased |
|----------------|----------|--------------|
| **Exposed**    | a        | b            |
| **Unexposed**  | c        | d            |

The *risk* (cumulative incidence) in the exposed is \( a/(a+b) \); in the unexposed it is \( c/(c+d) \). The *risk ratio* (relative risk) is

\[ \text{RR} = \frac{a/(a+b)}{c/(c+d)} \]

A risk ratio of 2.0 means exposed individuals are twice as likely to develop the outcome as unexposed individuals during the observation period. An RR of 1.0 means no association; less than 1.0 indicates a protective effect.

When person-time is the denominator, the analogous measure is the *rate ratio* (incidence density ratio), computed as exposed incidence rate divided by unexposed incidence rate. In case-control studies the odds ratio stands in for the risk ratio:

\[ \text{OR} = \frac{a \cdot d}{b \cdot c} \]

When the outcome is rare, the OR closely approximates the RR. When the outcome is common, the OR overstates the RR and should be interpreted accordingly.

Absolute measures tell you the extra burden of disease associated with exposure. The *risk difference* (attributable risk in the exposed) is

\[ \text{RD} = R_{\text{exposed}} - R_{\text{unexposed}} \]

If smokers have a five-year lung cancer risk of 0.02 and non-smokers a five-year risk of 0.002, the risk difference is 0.018 — eighteen extra cases per thousand smokers over five years. A small relative risk can produce a large risk difference if the baseline risk is high, and a huge relative risk can produce a negligible difference if the baseline risk is vanishingly small. Both relative and absolute measures are therefore needed to judge public health significance.

The *population attributable risk* (PAR) extends the logic to whole populations. It estimates how much of the total disease burden in the population would disappear if the exposure were eliminated, and depends on both the strength of association and the prevalence of exposure:

\[ \text{PAR} = R_{\text{population}} - R_{\text{unexposed}} \]

The *population attributable fraction* (PAF) expresses this as a proportion of total disease:

\[ \text{PAF} = \frac{P_e (\text{RR} - 1)}{1 + P_e (\text{RR} - 1)} \]

where \( P_e \) is the prevalence of exposure in the population. If 25 per cent of a population smokes and smokers have a tenfold lung cancer risk, roughly 69 per cent of lung cancer cases in that population are attributable to smoking. PAFs guide priority setting: a modestly elevated risk ratio from a very common exposure may matter more for public health than a huge risk ratio from a rare one.

Any measure of association should be accompanied by an expression of precision — typically a 95 per cent confidence interval. A confidence interval that excludes the null value (1.0 for ratios, 0 for differences) corresponds to a statistically significant result at the conventional level. A wide interval warns the reader that the estimate is imprecise, even if the point estimate looks dramatic.

## Chapter 11 — Bias: Selection and Information

A *valid* study estimates the truth. *Bias* is any systematic error that makes the estimate drift from the truth regardless of sample size. You cannot fix bias by collecting more data — more data just makes a biased estimate more precisely wrong. Two classical categories, catalogued by Delgado-Rodriguez and Llorca and by Sander Greenland, are selection bias and information bias.

*Selection bias* arises when the people in the analysis differ systematically — with respect to the exposure-outcome relationship — from the source population they were meant to represent. *Berkson's bias* appears in hospital-based studies: because hospitalization depends on health, relationships observed among inpatients need not generalise. *Healthy worker effect* shows up in occupational cohorts: employed people tend to be healthier, so workers look protected compared to general population rates. *Volunteer bias* appears when participants opt in. *Loss to follow-up bias* appears when dropouts differ from retained participants on both exposure and outcome. *Non-response bias* affects surveys similarly. The common thread is that selection probabilities depend jointly on exposure and outcome.

*Information bias* (measurement bias) arises when exposure, outcome, or covariates are measured with error. Whether that error is problematic depends on whether it is *differential* or *non-differential*.

*Non-differential misclassification* of a binary exposure — equal error in cases and non-cases — tends to bias the risk ratio toward the null, making real effects look smaller. It can hide effects but rarely manufactures spurious ones in simple two-category analyses.

*Differential misclassification* occurs when errors correlate with the other variable — cases recalling past exposures more carefully than controls, or clinicians aware of exposure more aggressively seeking out the outcome. Differential errors can bias estimates in either direction. *Recall bias* and *interviewer bias* are common examples. *Detection bias* arises when exposed people are monitored more closely. *Reporting bias* occurs when participants selectively disclose sensitive exposures.

Counter-strategies. For selection bias: define the source population sharply, use random sampling, maximise retention, monitor dropouts, sample controls from the same base as cases. For information bias: use objective standardised measurements, blind data collectors, validate instruments, collect exposure data before outcome is known, and use probabilistic bias analysis to quantify residual uncertainty.

## Chapter 12 — Confounding and Effect Modification

*Confounding* is the problem of mixing up the effect of the exposure you care about with the effect of another variable. A confounder is a third variable that (1) causes the outcome, (2) is associated with the exposure in the source population, and (3) is not on the causal pathway between exposure and outcome. The canonical example: yellow fingers and lung cancer. They are associated only because both are caused by smoking. Smoking confounds the relationship, and once controlled, the apparent association vanishes.

Three design strategies prevent confounding at the source. *Randomization* distributes confounders equally between exposure groups on average. *Restriction* confines the study to a single category of the confounder (only non-smokers) at the cost of generalisability. *Matching* pairs cases with controls who share confounder values; effective but requires matched analysis and precludes studying matched factors as exposures.

Four analytic strategies handle confounding after data collection. *Stratification* analyses the association separately within strata of the confounder and produces a weighted summary such as a Mantel-Haenszel estimate. *Standardization* reweights rates to a common distribution. *Multivariable regression* models exposure, outcome, and confounders simultaneously — logistic for binary outcomes, Cox for survival, Poisson for counts. *Propensity scores* and *inverse probability weighting* model the probability of exposure as a function of covariates and use it to match, stratify, or weight observations.

*Residual confounding* always remains a concern. Confounders can be unmeasured, mismeasured, or modelled in the wrong functional form. Sensitivity analyses such as E-values (VanderWeele and Ding) quantify how strong an unmeasured confounder would need to be to explain away the observed effect.

*Effect modification* (interaction) is a different phenomenon and not a bias. It occurs when the exposure-outcome association varies across levels of a third variable. Aspirin's effect on colorectal cancer may differ with a genetic variant; alcohol's effect on breast cancer may differ by hormone therapy use. Effect modification is part of biology — something you want to learn about, not eliminate. It is detected by stratifying and comparing effect measures or by including interaction terms in regression. Additive interaction (risk difference scale) often matters more for public health decisions, while multiplicative interaction (risk ratio scale) is what most regression models report by default.

## Chapter 13 — Screening and Diagnostic Test Accuracy

Screening applies a test to apparently healthy people in order to detect disease or pre-disease early enough to intervene. The implicit promise is that treatment started early will do more good than treatment started late. That promise requires a suitable condition (important, with a detectable preclinical phase and an effective early treatment), a suitable test (accurate, acceptable, affordable), and a suitable population (at risk, able to benefit). Wilson and Jungner's criteria, articulated for WHO in 1968, remain the classical checklist.

Test accuracy is summarized with a two-by-two table that compares test results against a reference standard. Let \( a \) be true positives (test+, disease+), \( b \) false positives (test+, disease–), \( c \) false negatives (test–, disease+), and \( d \) true negatives (test–, disease–).

*Sensitivity* is the probability that a diseased person tests positive:

\[ \text{Sensitivity} = \frac{a}{a + c} \]

*Specificity* is the probability that a non-diseased person tests negative:

\[ \text{Specificity} = \frac{d}{b + d} \]

Sensitivity and specificity are properties of the test and (in a fixed population) do not depend on prevalence. Highly sensitive tests rule disease *out* when negative (SnNOut); highly specific tests rule disease *in* when positive (SpPIn).

The predictive values tell you what a test result *means* for an individual.

*Positive predictive value* is the probability that a test-positive person actually has the disease:

\[ \text{PPV} = \frac{a}{a + b} \]

*Negative predictive value* is the probability that a test-negative person actually does not have the disease:

\[ \text{NPV} = \frac{d}{c + d} \]

Unlike sensitivity and specificity, PPV and NPV depend critically on prevalence. In a population where the disease is rare, even a highly specific test will generate many false positives relative to true positives, and PPV will be low. This is why screening tests for rare conditions in unselected populations often lead to high rates of false alarms, unnecessary follow-up tests, anxiety, and harms.

When a test yields a continuous result (PSA, blood glucose, antibody titre), the investigator must choose a cut-off. Lowering the cut-off raises sensitivity but lowers specificity; raising it does the opposite. The *receiver operating characteristic* (ROC) curve plots sensitivity against (1 – specificity) across all possible cut-offs, and the area under the curve (AUC) summarises overall discrimination.

*Reliability* (reproducibility) is distinct from validity. A test can give consistent results that are consistently wrong. Intra-rater reliability is the agreement of the same rater on repeated readings; inter-rater reliability is the agreement between different raters. Cohen's kappa adjusts percentage agreement for chance. Screening programmes must also reckon with two biases that can make them look better than they are: *lead-time bias*, where earlier detection lengthens apparent survival without postponing death; and *length-biased sampling*, where slower-growing, more indolent cancers are preferentially detected by screening, inflating apparent survival benefit.

## Chapter 14 — Causation: Hill's Criteria and Counterfactuals

An association is not a cause. A correlation between two variables can arise from chance, bias, confounding, or reverse causation, and only after these have been ruled out does causal interpretation become tenable. Epidemiology has two complementary frameworks for causal reasoning: the pragmatic considerations articulated by Austin Bradford Hill in 1965, and the counterfactual framework developed most fully by Rothman, Greenland, Hernán, Robins, and the causal inference community.

Hill, in his 1965 address to the Royal Society of Medicine, proposed nine *viewpoints* to help judge whether an association is likely causal. He insisted they were not rules and that none was indispensable. *Strength* — a large relative risk is harder to explain away by confounding. *Consistency* — the association holds across studies, populations, and methods. *Specificity* — one cause produces one effect (a criterion Hill himself noted was weak). *Temporality* — the cause precedes the effect, the one criterion Hill called a requirement. *Biological gradient* — dose-response relationships strengthen causal inference. *Plausibility* — the association fits with existing biological knowledge. *Coherence* — the causal interpretation does not conflict with known natural history. *Experiment* — when removing the exposure changes the outcome, evidence is stronger. *Analogy* — similar relationships have been established in related contexts. Hill's criteria should be read as prompts for judgement, not a scoring rubric.

The *counterfactual framework* makes causation formal. The causal effect of an exposure on an individual is defined as the difference between their outcome under exposure and their outcome under no exposure. Because no one can be both exposed and unexposed, individual causal effects are fundamentally unobservable — the "fundamental problem of causal inference". Epidemiologists instead estimate an *average* causal effect by comparing an exposed group to an *exchangeable* unexposed comparison group. Randomization creates exchangeability by construction; in observational studies, it is an assumption we approximate through adjustment, restriction, matching, and weighting.

Rothman's *sufficient-component cause* model (the causal pie) complements this view. A *sufficient cause* is a minimal set of conditions that inevitably produces the outcome. Each piece of the pie is a *component cause*; a component is *necessary* if every sufficient cause contains it. Many diseases have multiple sufficient causes, and removing one component from a pie is enough to prevent that particular pathway to disease.

Modern causal inference uses two complementary languages. *Potential outcomes*, associated with Rubin and extended by Hernán and Robins, write the effect as a contrast between \( Y^{a=1} \) and \( Y^{a=0} \). *Directed acyclic graphs* (DAGs), associated with Judea Pearl, draw the qualitative causal structure as a graph and use graphical rules to decide which variables must be adjusted for and which must not. Conditioning on a *collider* (a common effect of two variables) induces spurious association; conditioning on a *confounder* removes it. Thinking graphically makes these distinctions visible.

## Chapter 15 — Systematic Reviews and Evidence-Based Medicine

Epidemiology produces thousands of studies every year. Individual studies are finite, imprecise, and sometimes contradictory. *Evidence-based medicine* (EBM), as articulated by Sackett and colleagues, insists that clinical and policy decisions should draw on the best current evidence, integrated with clinical expertise and patient values. Systematic reviews are the mechanism by which the literature on a question is synthesised transparently and reproducibly.

A *systematic review* follows an explicit, pre-specified protocol. The protocol states the question in PICO format — population, intervention, comparator, outcome — and specifies search strategy, inclusion criteria, risk-of-bias assessment, and planned synthesis methods before the review is conducted. The review then searches multiple databases comprehensively, screens titles and abstracts (usually by two independent reviewers), retrieves full texts, assesses risk of bias using tools such as Cochrane RoB 2 for trials or ROBINS-I for non-randomized studies, extracts data, and synthesises results. When studies are similar enough, results are combined in a *meta-analysis* yielding a weighted summary estimate. When they are not, a narrative synthesis is reported instead.

The *PRISMA 2020* statement (Page et al., BMJ 2021) is the current reporting standard. It provides a 27-item checklist and a flow diagram documenting how records moved from retrieval through screening, eligibility, and inclusion. PRISMA does not tell you how to do a review; it tells you how to report one so readers can judge quality and reproduce the process.

*Heterogeneity* — variation in effect estimates across studies — is assessed visually (forest plots) and statistically (Cochran's Q, I²). Substantial heterogeneity prompts subgroup analysis and meta-regression rather than a reflexive pooled estimate. *Publication bias* — positive results being published more readily than null ones — is assessed with funnel plots and Egger's test, with known limitations.

EBM ranks evidence by study design, with systematic reviews of randomized trials at the top, followed by individual RCTs, cohort studies, case-control studies, case series, and expert opinion. Modern frameworks such as GRADE refine this by downgrading for risk of bias, inconsistency, indirectness, imprecision, and publication bias, and upgrading for large effects, dose-response, and consistent adjustment. A systematic review paired with a GRADE profile is the standard input to clinical practice guidelines.

## Chapter 16 — Outbreak Investigation and Infectious Disease Epidemiology

Infectious disease epidemiology traces the occurrence, spread, and control of communicable diseases. *Endemic* disease is the baseline level habitually present. An *outbreak* or *epidemic* is an increase in disease above the expected level in a defined population and time. A *pandemic* is an epidemic crossing international boundaries and affecting many people.

Key concepts. The *basic reproduction number* \( R_0 \) is the expected number of secondary cases from a single infection in a fully susceptible population; if \( R_0 > 1 \), the disease can spread. The *effective reproduction number* \( R_t \) allows for immunity and intervention effects and governs real epidemic trajectories. The *incubation period* is time from infection to symptom onset; the *latent period* from infection to infectiousness; the *serial interval* the time between symptom onsets in successive cases. *Herd immunity* is the indirect protection susceptible individuals enjoy when enough of the population is immune to interrupt transmission, with threshold roughly \( 1 - 1/R_0 \).

Transmission routes include airborne, droplet, contact, fecal-oral, vector-borne, bloodborne, and vertical. Control strategies are tailored to route: vaccination, isolation and quarantine, case finding and contact tracing, vector control, sanitation, prophylactic medications, and public education. *Vaccine efficacy* is estimated from trials as

\[ \text{VE} = 1 - \text{RR} \]

where RR is the risk ratio comparing vaccinated to unvaccinated. A VE of 0.80 means an 80 per cent reduction in outcome relative to unvaccinated.

*Outbreak investigation* follows a sequence formalised by CDC field epidemiology training: prepare for field work; establish the existence of an outbreak by comparing case counts to baseline; verify the diagnosis; construct a working case definition (often graded confirmed, probable, suspected); find cases systematically; perform descriptive epidemiology — plot an epidemic curve, map cases, describe person characteristics; develop hypotheses about agent, source, and mode of transmission; evaluate hypotheses with analytic epidemiology (retrospective cohort for a defined group such as a wedding or cruise ship, case-control for dispersed populations); refine hypotheses; implement control and prevention measures as soon as the evidence justifies them; and communicate findings to communities, authorities, and the literature.

The *epidemic curve* is the investigator's most informative graphic. A steep unimodal curve suggests a point source (a single contaminated meal). A plateau suggests a continuous or intermittent source. Successive peaks one incubation period apart suggest propagated person-to-person spread. Good outbreak investigation combines speed and rigour: early decisions must be made on incomplete information, and the cost of delay has to be balanced against the cost of unwarranted alarm.

## Closing Notes

Epidemiology is a discipline of measurement, comparison, and inference. It counts cases, turns them into rates, chooses designs that match the question, and reasons about whether the patterns it finds are real and causal. Its results drive much of modern public health — from vaccination schedules to air quality standards, from drug approval to dietary guidance. Conclusions are always provisional; the field's honesty about bias, confounding, and uncertainty is one of its quiet strengths. Mastering the tools in these chapters gives you the equipment to read, critique, and contribute to evidence that shapes how societies care for the health of their populations.
