---
title: "PSYCH 339: Personnel Psychology"
subjects: "PSYCH"
prof: "James Beck"
---

## Sources and References

**Primary textbook** — None assigned

**Supplementary texts** — Cascio, W. F., & Aguinis, H. (2019). *Applied Psychology in Talent Management*. Sage.; Gatewood, R. D., Feild, H. S., & Barrick, M. (2016). *Human Resource Selection*. Cengage.; Catano, V. M. et al. (2020). *Recruitment and Selection in Canada*. Nelson.

**Online resources** — SIOP (siop.org), Canadian Human Rights Commission

**Assigned readings** — Wilmot et al. (2014); Kuncel & Hezlett (2007); Highhouse et al. (2019)

---

# Chapter 1: Introduction to Personnel Psychology

## What Is Personnel Psychology?

Personnel psychology is a major subfield of **industrial-organizational (I/O) psychology** that focuses on the application of psychological principles and research methods to human resource issues in the workplace. While industrial psychology historically addressed topics such as job analysis, selection, training, and performance appraisal, organizational psychology concerned itself with motivation, leadership, group dynamics, and organizational culture. Personnel psychology sits squarely on the "industrial" side of this division, though modern practice blurs these boundaries considerably.

At its core, personnel psychology asks a deceptively simple question: how can organizations identify, select, develop, and retain people who will perform their jobs effectively? Answering that question requires a sophisticated understanding of human individual differences, psychometrics, statistical prediction, legal frameworks, and organizational contexts.

## A Brief History of Personnel Psychology

The roots of personnel psychology stretch back to the early twentieth century. **Hugo Munsterberg**, often called the father of applied psychology, published *Psychology and Industrial Efficiency* in 1913, advocating for the use of psychological testing in employee selection. During World War I, the U.S. Army commissioned the development of the **Army Alpha and Army Beta tests** to classify recruits by intellectual ability — one of the first large-scale applications of mental testing.

The interwar period saw the growth of applied psychology in industry. The **Hawthorne studies** (1924–1932) at Western Electric highlighted the importance of social and psychological factors in productivity, although their primary contributions were to organizational rather than personnel psychology. Meanwhile, personnel selection research advanced through the development of structured interviews, biographical inventories, and aptitude test batteries.

World War II catalyzed further progress. The **Assessment Center method**, originally developed by the British War Office Selection Boards and the U.S. Office of Strategic Services (OSS), introduced multi-method, multi-assessor evaluation procedures that remain in use today. The postwar decades saw the professionalization of I/O psychology, the founding of the **Society for Industrial and Organizational Psychology (SIOP)** as Division 14 of the American Psychological Association, and the publication of foundational texts on personnel selection and psychometrics.

In Canada, the development of personnel psychology was shaped by the country's distinct legal, linguistic, and cultural context. The passage of the **Canadian Human Rights Act (1977)** and the **Employment Equity Act (1986, revised 1995)** created a regulatory environment that differs meaningfully from the U.S. framework, with implications for how selection systems are designed, validated, and defended.

## The Canadian Context

Personnel psychology in Canada operates within a bilingual, multicultural, and rights-based legal framework. Several features distinguish the Canadian context:

- **Human rights legislation** exists at both the federal and provincial/territorial levels. The Canadian Human Rights Act prohibits discrimination in federally regulated workplaces on grounds including race, national or ethnic origin, colour, religion, age, sex, sexual orientation, gender identity or expression, marital status, family status, genetic characteristics, disability, and conviction for a pardoned offence.
- **Employment equity** legislation requires federally regulated employers to identify and remove barriers for four designated groups: women, Aboriginal peoples, persons with disabilities, and members of visible minorities.
- The **Canadian Charter of Rights and Freedoms** (Section 15) guarantees equality before and under the law, which has implications for employment practices even in the private sector through its influence on human rights legislation.
- The concept of a **bona fide occupational requirement (BFOR)** — established in landmark cases such as *British Columbia (Public Service Employee Relations Commission) v. BCGSEU* (the "Meiorin" decision, 1999) — sets the standard for justifying selection criteria that have adverse impact on protected groups.

These legal frameworks mean that Canadian personnel psychologists must be attentive not only to the psychometric quality of their tools but also to their fairness and compliance with human rights principles.

## The Scientist-Practitioner Model

Personnel psychology is firmly grounded in the **scientist-practitioner model**, which holds that effective practice must be informed by rigorous research, and that research questions should be driven by practical problems. This model, articulated at the 1949 Boulder Conference for clinical psychology, has been equally embraced by I/O psychologists.

In practice, the scientist-practitioner model means that personnel psychologists:

1. Use **evidence-based methods** for selection, appraisal, and training, rather than relying on intuition or tradition.
2. Apply **research methodology** (experimental design, psychometrics, statistics) to evaluate the effectiveness of HR interventions.
3. Stay current with the **research literature** and integrate findings from meta-analyses and validity generalization studies into practice.
4. Contribute to knowledge through **applied research**, often conducted within organizational settings.

This dual commitment to science and practice is what distinguishes personnel psychology from lay approaches to hiring and management. As we will see throughout this course, many common organizational practices — unstructured interviews, graphology, brainteaser questions — lack empirical support, while well-validated methods are often underused.

## Overview of the Course

This course covers the major topics in personnel psychology in a logical sequence:

1. **Statistical foundations** — the tools needed to evaluate personnel research (variance, correlation, regression).
2. **Job performance** — defining and modeling the criterion we are trying to predict.
3. **Performance appraisal** — measuring job performance in practice.
4. **Job analysis** — systematically describing what jobs require.
5. **Measurement fundamentals** — the principles underlying psychological testing.
6. **Reliability and validity** — evaluating the quality of measurements.
7. **Predictor constructs and methods** — what we measure and how we measure it in selection.
8. **Selection decision-making** — combining information to make hiring decisions.
9. **Legal and ethical issues** — the regulatory and moral framework for selection.
10. **Recruitment** — attracting applicants to organizations.
11. **Utility analysis** — quantifying the economic value of selection systems.

---

# Chapter 2: Statistical Foundations

## Why Statistics Matter in Personnel Psychology

Personnel psychology is fundamentally a science of **prediction**. We want to predict who will perform well on the job, who will stay with the organization, who will benefit from training. Making these predictions requires quantitative tools. This chapter reviews the statistical concepts that underpin the rest of the course: variance, correlation, regression, effect sizes, and meta-analysis.

## Variance

<div class="definition">
<strong>Variance</strong> is a measure of the spread or dispersion of scores around the mean. It is defined as the average of the squared deviations from the mean:

\[
s^2 = \frac{\sum_{i=1}^{N}(X_i - \bar{X})^2}{N - 1}
\]

where \( X_i \) is each individual score, \( \bar{X} \) is the sample mean, and \( N \) is the number of observations. The <strong>standard deviation</strong> \( s \) is the square root of the variance.
</div>

Variance is important in personnel psychology because it tells us how much individuals differ from one another on a given attribute. If there is no variance in job performance — if everyone performs at the same level — then there is no point in trying to select the best candidates. Selection is valuable precisely because people differ, and those differences are consequential.

**Range restriction** is a common problem in personnel research. When we study the relationship between a predictor (e.g., a cognitive ability test) and job performance, we typically can only observe performance for people who were hired. If hiring decisions were based (even partially) on the predictor, then the hired group will have less variance on the predictor than the full applicant pool. This **restriction of range** attenuates observed correlations and must be corrected statistically to estimate the true relationship.

## Correlation

<div class="definition">
<strong>Correlation</strong> (specifically, the Pearson product-moment correlation coefficient, \( r \)) quantifies the linear relationship between two variables. It ranges from \( -1 \) to \( +1 \):

\[
r = \frac{\sum_{i=1}^{N}(X_i - \bar{X})(Y_i - \bar{Y})}{\sqrt{\sum(X_i - \bar{X})^2 \cdot \sum(Y_i - \bar{Y})^2}}
\]

A value of \( r = 0 \) indicates no linear relationship; \( r = +1 \) indicates a perfect positive relationship; \( r = -1 \) indicates a perfect negative relationship.
</div>

In personnel psychology, the correlation between a predictor and a criterion is called a **validity coefficient**. For example, if we correlate scores on a cognitive ability test with supervisor ratings of job performance, the resulting \( r \) tells us how well the test predicts performance.

The square of the correlation coefficient, \( r^2 \), is called the **coefficient of determination** and represents the proportion of variance in one variable that is accounted for by the other. However, some researchers argue that \( r^2 \) can be misleading as a measure of practical significance, because even modest correlations can have substantial practical value when applied across large numbers of selection decisions.

### Interpreting Validity Coefficients

In personnel selection, validity coefficients rarely exceed \( r = .50 \). Cohen's (1988) benchmarks for small (\( r = .10 \)), medium (\( r = .30 \)), and large (\( r = .50 \)) effects are sometimes used, but these benchmarks were not designed for applied prediction contexts. In personnel selection, a validity of \( r = .30 \) is considered practically useful, and even validities of \( r = .15 \)–\( .20 \) can add value in high-volume selection.

## Regression

<div class="definition">
<strong>Simple linear regression</strong> models the relationship between a predictor \( X \) and a criterion \( Y \) as a linear function:

\[
\hat{Y} = a + bX
\]

where \( b = r \cdot \frac{s_Y}{s_X} \) is the regression slope and \( a = \bar{Y} - b\bar{X} \) is the intercept. <strong>Multiple regression</strong> extends this to multiple predictors:

\[
\hat{Y} = a + b_1X_1 + b_2X_2 + \cdots + b_kX_k
\]
</div>

Multiple regression is the statistical foundation for **compensatory selection models**, in which a high score on one predictor can compensate for a low score on another. The **multiple correlation coefficient** \( R \) indicates how well the set of predictors jointly predicts the criterion.

A practical concern in multiple regression is **shrinkage** — the tendency for the multiple \( R \) to be inflated in the sample used to develop the regression equation and to decrease (shrink) when applied to a new sample. **Cross-validation** is essential to estimate how well a regression equation will generalize.

## Effect Sizes and Practical Significance

Beyond statistical significance (which depends heavily on sample size), personnel psychologists are increasingly interested in **effect sizes** — standardized measures of the magnitude of a relationship or difference. Common effect size metrics include:

| Metric | Formula | Interpretation |
|--------|---------|----------------|
| Pearson \( r \) | See above | Strength of linear association |
| Cohen's \( d \) | \( d = \frac{\bar{X}_1 - \bar{X}_2}{s_p} \) | Standardized mean difference |
| Odds ratio | \( OR = \frac{p_1/(1-p_1)}{p_2/(1-p_2)} \) | Ratio of odds between groups |

## Meta-Analysis

<div class="definition">
<strong>Meta-analysis</strong> is a quantitative method for statistically combining the results of multiple studies on the same topic. In personnel psychology, meta-analysis has been transformative, allowing researchers to estimate the average validity of selection methods across many studies while correcting for statistical artifacts such as sampling error, range restriction, and criterion unreliability.
</div>

The pioneering meta-analytic work of **Schmidt and Hunter** demonstrated that much of the variability in validity coefficients across studies was due to statistical artifacts rather than true differences in validity across situations. This finding — known as **validity generalization** — challenged the earlier view that validity was necessarily situation-specific and had to be established locally for every job and organization.

Key meta-analytic findings that will recur throughout this course include:

- **General mental ability (GMA)** tests have an estimated operational validity of \( \rho \approx .51 \) for predicting job performance across jobs (Schmidt & Hunter, 1998).
- **Structured interviews** are substantially more valid than unstructured interviews.
- **Conscientiousness** is the Big Five personality trait most consistently related to job performance across occupations.
- **Work sample tests** show high validity but are expensive to develop and administer.

---

# Chapter 3: Job Performance

## Defining Job Performance

Before we can select employees effectively, we need to understand what we are trying to predict. **Job performance** is the criterion — the outcome variable — in personnel selection. Defining and measuring job performance is therefore a foundational concern.

<div class="definition">
<strong>Job performance</strong> can be defined as the set of behaviors that are relevant to the goals of the organization and that are under the control of the individual employee. This definition emphasizes that performance is <em>behavioral</em> (what people do, not what happens to them), <em>evaluative</em> (some behaviors are more valued than others), and <em>multidimensional</em> (there are multiple types of performance-relevant behavior).
</div>

It is important to distinguish performance from related constructs:

- **Effectiveness** refers to outcomes that may be influenced by factors beyond the individual's control (e.g., sales revenue depends on market conditions).
- **Productivity** is typically a ratio of outputs to inputs.
- **Utility** refers to the value of performance to the organization.

## Campbell's Model of Job Performance

**John Campbell** and colleagues proposed one of the most influential taxonomies of job performance, identifying eight components that apply across jobs:

1. **Job-specific task proficiency** — core technical tasks of the position.
2. **Non-job-specific task proficiency** — tasks that are common across many jobs in the organization.
3. **Written and oral communication** — the ability to convey information clearly.
4. **Demonstrating effort** — the willingness to work hard and persist.
5. **Maintaining personal discipline** — avoiding counterproductive behaviors.
6. **Facilitating peer and team performance** — helping and cooperating with coworkers.
7. **Supervision/leadership** — guiding and motivating subordinates.
8. **Management/administration** — organizing resources and handling administrative duties.

Campbell argued that all jobs can be described in terms of some subset of these components, and that each component has distinct determinants: **declarative knowledge** (knowing what to do), **procedural knowledge and skill** (knowing how to do it), and **motivation** (choosing to do it).

## Task Performance vs. Contextual Performance

A seminal distinction in the performance literature is between **task performance** and **contextual performance** (Borman & Motowidlo, 1993):

- **Task performance** refers to activities that contribute to the organization's technical core, either directly (producing goods or services) or indirectly (supporting the technical core). Task performance varies across jobs and is closely related to job-specific knowledge and skills.
- **Contextual performance** refers to activities that support the organizational, social, and psychological environment in which the technical core operates. Examples include volunteering for extra duties, helping coworkers, following organizational rules, and endorsing organizational objectives. Contextual performance is more similar across jobs and is more strongly related to personality (especially conscientiousness and agreeableness) than to cognitive ability.

This distinction matters for selection because different predictors may be optimal for predicting different aspects of performance.

## Organizational Citizenship Behavior (OCB)

<div class="definition">
<strong>Organizational citizenship behavior (OCB)</strong> refers to individual behavior that is discretionary, not directly or explicitly recognized by the formal reward system, and that in the aggregate promotes the effective functioning of the organization (Organ, 1988). OCBs overlap substantially with contextual performance.
</div>

Common dimensions of OCB include:

- **OCB-I (individual)** — behaviors directed toward specific individuals (e.g., helping a coworker who has been absent).
- **OCB-O (organizational)** — behaviors directed toward the organization as a whole (e.g., defending the organization when others criticize it).
- **Altruism** — voluntarily helping others with work-related problems.
- **Conscientiousness** (in the OCB sense) — going beyond minimum role requirements.
- **Sportsmanship** — tolerating inconveniences without complaining.
- **Courtesy** — taking steps to prevent problems with others.
- **Civic virtue** — participating in organizational governance.

Research has shown that OCBs are related to both employee attitudes (job satisfaction, organizational commitment) and personality traits, and that they contribute to organizational effectiveness.

## Counterproductive Work Behavior (CWB)

<div class="definition">
<strong>Counterproductive work behavior (CWB)</strong> refers to voluntary behavior that harms or is intended to harm the organization or its members. CWBs represent the negative end of the performance continuum.
</div>

CWBs include theft, sabotage, absenteeism, aggression, substance abuse on the job, and cyberloafing. They can be directed at the organization (CWB-O) or at individuals (CWB-I). Research suggests that CWBs are predicted by personality traits (low conscientiousness, low agreeableness, low emotional stability), situational factors (perceived injustice, poor supervision), and their interaction.

There is debate about whether CWB and OCB are opposite ends of a single continuum or distinct constructs. The evidence suggests they are related but not perfectly inverse — it is possible for an employee to engage in both citizenship and counterproductive behaviors.

## The Dynamic Criterion

An important question is whether job performance is stable over time or changes. The **dynamic criterion** hypothesis suggests that the validity of predictors may change as employees gain experience, because the determinants of performance shift from ability to motivation, or because individuals' relative standing changes.

Research on this question has produced mixed results. While there is some evidence that validity coefficients can change over time, the changes are generally modest. Nevertheless, the dynamic criterion concept reminds us that performance is not a static attribute but an evolving pattern of behavior.

---

# Chapter 4: Performance Appraisal

## Why Appraise Performance?

**Performance appraisal** is the systematic process of evaluating employees' job performance. It serves multiple purposes:

- **Administrative decisions** — promotion, termination, compensation, and placement.
- **Developmental feedback** — identifying strengths and areas for improvement.
- **Criterion data for validation** — performance appraisal ratings are commonly used as the criterion in selection validation studies.
- **Documentation** — creating a record that can be used in legal proceedings if employment decisions are challenged.

## Types of Performance Measures

Performance measures can be classified into several categories:

### Objective Measures

**Objective performance measures** include quantifiable outputs such as sales volume, units produced, error rates, and absenteeism. Their advantages include apparent objectivity and ease of quantification. However, they suffer from several problems:

- **Criterion deficiency** — they often capture only a narrow slice of the performance domain.
- **Criterion contamination** — they may be influenced by factors beyond the individual's control.
- **Opportunity bias** — employees may have unequal opportunities to demonstrate performance.

### Subjective Measures (Ratings)

Most performance appraisal in organizations relies on **subjective ratings**, typically provided by supervisors. Ratings have the advantage of being applicable to virtually any job and can capture the full range of performance dimensions. However, they are susceptible to various biases and errors.

## Rating Scale Formats

Several rating scale formats have been developed:

| Format | Description | Advantages | Disadvantages |
|--------|-------------|------------|---------------|
| **Graphic rating scales** | Rate on a continuum (e.g., 1–5) with anchors at endpoints | Simple, versatile | Vague anchors, rater discretion |
| **BARS** (Behaviorally Anchored Rating Scales) | Scale points anchored with specific behavioral examples | Reduced ambiguity, job-specific | Expensive to develop |
| **BOS** (Behavioral Observation Scales) | Rate frequency of specific behaviors | Based on observable behavior | Lengthy, may require extensive observation |
| **MSS** (Mixed Standard Scales) | Statements representing good, average, and poor performance are mixed | Can detect careless or biased responding | Complex scoring |

## Rater Errors and Biases

A perennial concern in performance appraisal is the tendency for ratings to be distorted by various **rater errors**:

- **Halo error** — the tendency to rate an employee similarly across all dimensions based on an overall impression, rather than distinguishing between dimensions.
- **Leniency/severity** — the tendency to rate all employees too high (leniency) or too low (severity) relative to their true performance.
- **Central tendency** — the tendency to avoid extreme ratings and rate everyone near the midpoint of the scale.
- **Recency effects** — giving disproportionate weight to recent performance rather than performance over the entire rating period.
- **Contrast effects** — rating an employee higher or lower based on comparison with the previous employee rated, rather than against an absolute standard.
- **Similar-to-me bias** — rating employees more favorably when they share characteristics (demographics, attitudes, background) with the rater.

## 360-Degree Feedback

<div class="definition">
<strong>360-degree feedback</strong> (also called multi-source feedback) involves collecting performance ratings from multiple sources: supervisors, peers, subordinates, and sometimes customers or clients, in addition to a self-assessment. The rationale is that different raters have different vantage points and can observe different aspects of performance.
</div>

Research on 360-degree feedback has found that:

- Different rating sources show only moderate agreement, suggesting they are capturing somewhat different aspects of performance.
- **Self-ratings** tend to be more lenient and less correlated with other sources than ratings from supervisors or peers.
- **Peer ratings** can be valid predictors of future performance and are less susceptible to halo error than supervisor ratings.
- The effectiveness of 360-degree feedback depends on how the information is used — it is generally more effective for developmental purposes than for administrative decisions.

## Frame-of-Reference Training

<div class="definition">
<strong>Frame-of-reference (FOR) training</strong> is a rater training program designed to improve rating accuracy by ensuring that all raters share a common conceptual framework for evaluating performance. FOR training involves defining performance dimensions, providing behavioral examples at different effectiveness levels, and having raters practice applying these standards.
</div>

Research has consistently shown that FOR training is the most effective approach to improving rating accuracy, outperforming rater error training (which teaches raters about common errors but may simply shift the distribution of ratings without improving accuracy) and behavioral observation training.

---

# Chapter 5: Job Analysis

## What Is Job Analysis?

<div class="definition">
<strong>Job analysis</strong> is the systematic process of collecting, documenting, and analyzing information about the content, context, and requirements of a job. It answers the questions: What does this job involve? What knowledge, skills, abilities, and other characteristics (KSAOs) are needed to perform it?
</div>

Job analysis is the foundation of virtually every personnel psychology activity:

- **Selection** — job analysis identifies the KSAOs that selection tools should measure.
- **Performance appraisal** — job analysis defines the dimensions on which performance should be evaluated.
- **Training** — job analysis identifies the tasks that must be trained and the KSAOs that trainees need to develop.
- **Job evaluation and compensation** — job analysis provides the basis for determining the relative value of jobs.
- **Legal defense** — job analysis provides evidence that selection criteria are job-related (a key requirement under Canadian human rights law).

## Job Analysis Methods

### Observation and Interview

The most basic methods involve directly **observing** workers as they perform their jobs and **interviewing** them (and their supervisors) about what the job entails. These methods are flexible and can capture qualitative detail, but they are time-consuming and may be influenced by the analyst's biases.

### Critical Incidents Technique

The **critical incidents technique** (Flanagan, 1954) involves collecting descriptions of specific behaviors that represent particularly effective or ineffective job performance. Subject matter experts (SMEs) provide detailed accounts of incidents they have observed, which are then sorted into categories representing performance dimensions.

Critical incidents are especially useful for developing behaviorally anchored rating scales (BARS) and for identifying the KSAOs that distinguish good from poor performers.

### Position Analysis Questionnaire (PAQ)

The **Position Analysis Questionnaire** (McCormick, Jeanneret, & Mecham, 1972) is a structured, standardized job analysis instrument that describes jobs in terms of 195 job elements organized into six categories:

1. Information input
2. Mental processes
3. Work output
4. Relationships with other persons
5. Job context
6. Other job characteristics

The PAQ is **worker-oriented** — it describes the behaviors and processes workers use, rather than the specific tasks of the job. This makes it applicable across a wide range of jobs and allows for quantitative comparisons between jobs.

### O*NET

The **Occupational Information Network (O\*NET)**, developed by the U.S. Department of Labor, is a comprehensive database of occupational information. While American in origin, O\*NET is widely used in Canada and internationally as a starting point for understanding job requirements. O\*NET describes occupations in terms of:

- Worker characteristics (abilities, interests, work values, work styles)
- Worker requirements (skills, knowledge, education)
- Experience requirements
- Occupational requirements (work activities, work context, organizational context)
- Occupation-specific information (tasks, tools, technology)
- Workforce characteristics (labor market information)

Canada has developed its own occupational classification system, the **National Occupational Classification (NOC)**, which categorizes occupations based on skill type and skill level.

### Competency Modeling

<div class="definition">
<strong>Competency modeling</strong> is an approach to describing job requirements in terms of broad, behaviorally defined competencies (e.g., leadership, teamwork, communication, adaptability) that are linked to organizational strategy and values. Unlike traditional job analysis, which focuses on specific tasks and KSAOs, competency modeling emphasizes the characteristics needed for success across a family of jobs or an entire organization.
</div>

Critics argue that competency modeling lacks the rigor and specificity of traditional job analysis, often producing generic competency lists that could apply to almost any managerial job. Proponents counter that competency modeling is more aligned with organizational strategy, more understandable to non-psychologists, and better suited to rapidly changing work environments.

In practice, the best approaches often combine elements of traditional job analysis (for legal defensibility and psychometric rigor) with competency modeling (for strategic alignment and organizational buy-in).

---

# Chapter 6: Measurement Fundamentals

## Classical Test Theory

<div class="definition">
<strong>Classical test theory (CTT)</strong> provides the foundational framework for understanding psychological measurement. Its core equation is:

\[
X = T + E
\]

where \( X \) is the observed score, \( T \) is the true score (the hypothetical score that would be obtained if measurement were perfect), and \( E \) is measurement error (random fluctuations that cause observed scores to deviate from true scores).
</div>

Key assumptions of CTT include:

- The expected value of error is zero: \( E(E) = 0 \).
- Error is uncorrelated with the true score: \( r_{TE} = 0 \).
- Errors on different measurements are uncorrelated: \( r_{E_1E_2} = 0 \).

From these assumptions, it follows that the variance of observed scores equals the variance of true scores plus the variance of error:

\[
\sigma_X^2 = \sigma_T^2 + \sigma_E^2
\]

**Reliability** is defined as the proportion of observed score variance that is true score variance:

\[
\text{Reliability} = \frac{\sigma_T^2}{\sigma_X^2} = 1 - \frac{\sigma_E^2}{\sigma_X^2}
\]

## Scales of Measurement

Psychologists distinguish four **scales of measurement** (Stevens, 1946):

| Scale | Properties | Example | Permissible Statistics |
|-------|-----------|---------|----------------------|
| **Nominal** | Categories only | Job titles, gender | Mode, frequency |
| **Ordinal** | Rank order | Performance rankings | Median, percentiles |
| **Interval** | Equal intervals, arbitrary zero | IQ scores, temperature (°C) | Mean, standard deviation, correlation |
| **Ratio** | Equal intervals, true zero | Number of units produced, salary | All statistics, including ratios |

Most psychological tests produce scores that are treated as interval-level data, though the degree to which this assumption is met is often debated.

## Standardization

<div class="definition">
<strong>Standardization</strong> refers to the process of transforming raw scores into a common metric to allow meaningful comparison. The most common standardized score is the <strong>z-score</strong>:

\[
z = \frac{X - \bar{X}}{s}
\]

which expresses each score in terms of how many standard deviations it falls above or below the mean. Other standardized scores (T-scores, stanines, percentile ranks) are derived from z-scores.
</div>

Standardization is essential in personnel selection when combining scores from different tests that use different scales. Without standardization, a predictor measured on a larger numerical scale would receive undue weight in a composite.

## Norms and Score Interpretation

A test score has limited meaning in isolation. **Norms** provide the reference group against which individual scores are interpreted. Norm-referenced interpretation compares an individual's score to the distribution of scores in a relevant normative sample. The quality of norms depends on:

- The **size** of the normative sample.
- Its **representativeness** of the population to which the test will be applied.
- Its **recency** — norms can become outdated (the Flynn effect demonstrates systematic changes in cognitive ability test scores over time).

In personnel selection, norms may be based on the general population, on applicant pools for similar jobs, or on incumbent employees.

---

# Chapter 7: Reliability

## What Is Reliability?

<div class="definition">
<strong>Reliability</strong> refers to the consistency, stability, and repeatability of scores produced by a measurement instrument. A reliable test yields similar results under consistent conditions. In classical test theory, reliability is the ratio of true score variance to observed score variance.
</div>

Reliability is a necessary (but not sufficient) condition for validity. If a test does not measure consistently, it cannot measure accurately. However, a test can be highly reliable while measuring the wrong thing.

## Types of Reliability

### Test-Retest Reliability

**Test-retest reliability** is assessed by administering the same test to the same group on two occasions and correlating the two sets of scores. It estimates the stability of scores over time. A high test-retest correlation indicates that individuals maintain their relative standing across occasions.

Considerations:

- The time interval between administrations affects the estimate — longer intervals typically produce lower correlations.
- Practice effects and memory may inflate test-retest correlations for short intervals.
- Test-retest reliability is most appropriate for constructs assumed to be stable (e.g., cognitive ability) and less appropriate for constructs that may genuinely change (e.g., mood).

### Internal Consistency

**Internal consistency** reliability estimates the degree to which items within a test measure the same construct. The most common index is **Cronbach's alpha** (\( \alpha \)):

\[
\alpha = \frac{k}{k-1}\left(1 - \frac{\sum s_i^2}{s_X^2}\right)
\]

where \( k \) is the number of items, \( s_i^2 \) is the variance of item \( i \), and \( s_X^2 \) is the variance of total scores.

Alpha ranges from 0 to 1, with values above .70 generally considered acceptable for research purposes and values above .80 or .90 preferred for high-stakes decisions. However, alpha is influenced by test length (longer tests tend to have higher alpha) and is only appropriate for unidimensional scales.

**Split-half reliability** is a related approach: the test is divided into two halves (e.g., odd and even items), scores on the two halves are correlated, and the **Spearman-Brown formula** is applied to estimate the reliability of the full-length test:

\[
r_{XX'} = \frac{2r_{hh}}{1 + r_{hh}}
\]

where \( r_{hh} \) is the correlation between the two halves.

### Inter-Rater Reliability

**Inter-rater reliability** (or inter-rater agreement) assesses the degree to which different raters assign similar scores to the same targets. This is particularly important in personnel psychology for performance appraisal ratings, interview scores, and assessment center ratings.

Common indices include:

- **Intraclass correlation coefficient (ICC)** — the proportion of total variance attributable to true differences between ratees, rather than differences between raters.
- **Cohen's kappa** (\( \kappa \)) — a measure of agreement for categorical ratings that corrects for chance agreement.
- **Percentage agreement** — simple but does not correct for chance.

### Wilmot et al. (2014): Increasing Interrater Reliability Using Composite Performance Measures

<div class="remark">
Wilmot, Wiernik, and Kostal (2014) argued that low inter-rater reliability in performance ratings is a persistent problem that attenuates criterion-related validity estimates. They demonstrated that using <strong>composite performance measures</strong> — combining ratings from multiple raters or multiple performance dimensions — can substantially increase inter-rater reliability, much as adding items to a test increases internal consistency. This approach leverages the Spearman-Brown principle: aggregating multiple fallible measurements reduces the influence of idiosyncratic rater effects and yields a more reliable composite.

The practical implication is that organizations should collect and combine ratings from multiple sources rather than relying on a single supervisor's rating, and that researchers should correct for criterion unreliability when estimating the validity of selection tools.
</div>

## Standard Error of Measurement

<div class="definition">
The <strong>standard error of measurement (SEM)</strong> estimates the standard deviation of errors around an individual's true score:

\[
SEM = s_X\sqrt{1 - r_{XX'}}
\]

where \( s_X \) is the standard deviation of observed scores and \( r_{XX'} \) is the reliability coefficient. The SEM allows us to construct <strong>confidence intervals</strong> around observed scores:

\[
T \approx X \pm z_{\alpha/2} \cdot SEM
\]
</div>

The SEM has important practical implications in personnel selection. When two candidates' scores differ by less than one or two SEMs, the difference may not reflect a true difference in the underlying construct. This reasoning underlies the practice of **banding** in selection decision-making (discussed in Chapter 11).

---

# Chapter 8: Validity

## What Is Validity?

<div class="definition">
<strong>Validity</strong> refers to the degree to which evidence and theory support the interpretations of test scores for proposed uses. Validity is not a property of the test itself but of the inferences drawn from test scores. A test may be valid for one purpose (e.g., predicting job performance) but not another (e.g., diagnosing a learning disability).
</div>

Modern validity theory, as articulated in the *Standards for Educational and Psychological Testing* (AERA, APA, NCME, 2014), emphasizes that validity is a **unitary concept** — there is one overarching question (are the intended inferences justified?) — but evidence can come from multiple sources.

## Sources of Validity Evidence

### Content Validity

**Content validity** refers to the degree to which the content of a test is representative of the domain it is intended to measure. Content validation involves a systematic comparison of the test content with the job content, typically based on a thorough job analysis.

Content validity is established through **expert judgment** rather than statistical analysis. Subject matter experts evaluate whether test items are relevant to the job, whether the test covers the important aspects of the job domain, and whether the test does not include irrelevant content.

Content validation is particularly appropriate for:

- **Work sample tests** — where candidates perform actual job tasks.
- **Knowledge tests** — where the test covers job-related knowledge identified through job analysis.
- **Structured interviews** — where questions are based on job-related scenarios.

### Criterion-Related Validity

**Criterion-related validity** is established by demonstrating a statistical relationship between test scores (predictors) and measures of job performance (criteria). There are two designs:

- **Predictive validity** — administer the test to applicants, hire without using the test scores, then collect performance data later and correlate test scores with performance. This is the ideal design but is rarely feasible because it requires ignoring test results in hiring decisions.
- **Concurrent validity** — administer the test to current employees and correlate their scores with current performance measures. This is more practical but may be affected by range restriction (poor performers may have been terminated) and the effects of job experience.

The resulting correlation coefficient is the **validity coefficient**. In Canadian human rights law, criterion-related validity evidence is one way to demonstrate that a selection tool is a **bona fide occupational requirement (BFOR)**.

### Construct Validity

<div class="definition">
<strong>Construct validity</strong> is the degree to which a test measures the theoretical construct it is intended to measure. It is established through an accumulation of evidence from multiple sources, including:

<em>Convergent validity</em> — the test correlates with other measures of the same construct.
<em>Discriminant validity</em> — the test does not correlate too highly with measures of different constructs.
<em>Factor analysis</em> — the internal structure of the test is consistent with the theoretical structure of the construct.
<em>Group differences</em> — the test differentiates between groups known to differ on the construct.
<em>Nomological network</em> — the test relates to other variables in ways predicted by theory.
</div>

Construct validity is the most comprehensive form of validity evidence and subsumes content and criterion-related validity as special cases.

## Validity Generalization

<div class="definition">
<strong>Validity generalization (VG)</strong> is the finding, based on meta-analysis, that the validity of well-constructed tests generalizes across situations, organizations, and jobs, and that most of the variability in observed validity coefficients across studies is attributable to statistical artifacts rather than true situational specificity.
</div>

The VG research program, initiated by **Schmidt and Hunter** in the late 1970s, had profound implications for personnel selection practice:

1. Organizations may not need to conduct local validation studies if validity has been established meta-analytically for the same type of predictor and similar jobs.
2. Synthetic or **transportability** strategies — in which validity evidence from other settings is used to justify the use of a test — are scientifically defensible.
3. **Situational specificity** — the view that validity is unique to each organization and job — is largely unsupported for well-established predictors like cognitive ability tests.

However, VG has been debated. Critics argue that moderators (e.g., job complexity, criterion type) can meaningfully affect validity, and that blanket generalization without attention to context is unwarranted.

## Kuncel and Hezlett (2007): Standardized Tests Predict Graduate Students' Success

<div class="remark">
Kuncel and Hezlett (2007) reviewed the meta-analytic evidence on standardized admissions tests (such as the GRE, GMAT, LSAT, and MCAT) and concluded that these tests are valid predictors of graduate student success, including grades, degree attainment, research productivity, and faculty ratings. Their meta-analyses showed that standardized tests predicted outcomes above and beyond undergraduate GPA, supporting the incremental validity of these measures.

This work is relevant to personnel selection because it demonstrates the principle of <strong>validity generalization</strong>: well-constructed standardized tests of cognitive ability predict performance across a wide range of settings and criteria. It also illustrates the use of meta-analysis to resolve controversies about test validity.
</div>

## Threats to Validity

Several factors can affect the accuracy of validity estimates:

- **Range restriction** — when the sample has less variability on the predictor than the applicant pool (because selection has already occurred), the observed validity coefficient underestimates true validity.
- **Criterion contamination** — when the criterion measure is influenced by knowledge of predictor scores.
- **Criterion deficiency** — when the criterion measure fails to capture important aspects of performance.
- **Low reliability** — unreliability in either the predictor or the criterion attenuates the observed correlation.

Statistical corrections for range restriction and criterion unreliability are routinely applied in meta-analyses to estimate operational validity.

---

# Chapter 9: Predictor Constructs

## Overview

This chapter examines the major **psychological constructs** used in personnel selection — the "what" of selection, as distinct from the "how" (methods) covered in the next chapter. The constructs reviewed here are cognitive ability, personality, emotional intelligence, and integrity.

## General Mental Ability (GMA)

<div class="definition">
<strong>General mental ability (GMA)</strong>, also known as <em>g</em> or general intelligence, refers to the broad capacity to reason, solve problems, learn, and adapt. It is the single best predictor of job performance across virtually all occupations, with meta-analytic validity estimates ranging from \( \rho = .45 \) to \( .55 \) depending on job complexity (Schmidt & Hunter, 1998).
</div>

### Why GMA Predicts Performance

GMA predicts job performance primarily through its relationship with **job knowledge acquisition**. People higher in GMA learn job-relevant information more quickly and thoroughly, which translates into better task performance. The validity of GMA is higher for more complex jobs, because complex jobs place greater demands on learning and problem-solving.

### The Adverse Impact Problem

A major concern with GMA tests is that they produce **adverse impact** — substantial score differences between racial/ethnic groups and, to a lesser extent, between sexes. In the North American context, Black applicants score approximately one standard deviation below White applicants on average, with Hispanic applicants falling in between. These group differences create a tension between using the most valid predictor (GMA) and achieving a diverse workforce.

This tension — sometimes called the **diversity-validity dilemma** — is one of the central challenges in personnel selection and has motivated research on alternative predictors and selection strategies that may reduce adverse impact without sacrificing validity.

## The Big Five Personality Traits

<div class="definition">
The <strong>Big Five</strong> (or Five-Factor Model) is the dominant taxonomy of personality traits in psychology:

1. <strong>Openness to Experience</strong> — intellectual curiosity, creativity, preference for novelty.
2. <strong>Conscientiousness</strong> — dependability, organization, self-discipline, achievement striving.
3. <strong>Extraversion</strong> — sociability, assertiveness, positive emotionality.
4. <strong>Agreeableness</strong> — cooperativeness, trust, empathy.
5. <strong>Neuroticism</strong> (or its inverse, Emotional Stability) — tendency to experience negative emotions.
</div>

### Validity of Personality for Predicting Performance

Meta-analytic research has established the following patterns:

| Trait | Meta-analytic \( \rho \) for overall performance | Best criterion |
|-------|--------------------------------------------------|---------------|
| Conscientiousness | .22–.27 | Task performance, CWB (inverse) |
| Emotional Stability | .12–.15 | Teamwork, stress tolerance |
| Extraversion | .13–.15 (higher for sales, management) | Sales, leadership |
| Agreeableness | .10–.14 | Teamwork, OCB |
| Openness | .06–.10 | Training proficiency, creative jobs |

**Conscientiousness** is the most generalizable personality predictor, showing positive validity across occupations and criterion types. It predicts both task performance (through effort and persistence) and CWB (through rule-following and self-control).

### Faking and Social Desirability

A major concern with self-report personality measures in selection is **faking** — applicants may distort their responses to present themselves favorably. Research suggests that:

- Applicants can and do fake on personality tests, especially on conscientiousness and emotional stability.
- The effect of faking on the rank ordering of applicants is modest but not negligible.
- Various strategies (forced-choice formats, warnings, response time monitoring, applicant-report vs. other-report) can mitigate but not eliminate faking.

## Emotional Intelligence

<div class="definition">
<strong>Emotional intelligence (EI)</strong> refers to the ability to perceive, understand, manage, and use emotions effectively. Two major models exist:

<em>Ability-based EI</em> (Mayer, Salovey, Caruso) — measured with maximum-performance tests (e.g., MSCEIT) and conceptualized as a cognitive ability.
<em>Trait-based EI</em> (Petrides; Bar-On; Goleman) — measured with self-report questionnaires and conceptualized as a personality trait or set of self-perceptions.
</div>

The evidence on EI as a predictor of job performance is mixed:

- Ability-based EI shows some incremental validity beyond GMA and personality, particularly for jobs involving emotional labor.
- Trait-based EI overlaps substantially with existing Big Five traits and shows less incremental validity.
- The construct validity of EI measures remains debated, and the field has been criticized for over-promising and under-delivering.

## Integrity Tests

**Integrity tests** are designed to predict counterproductive work behaviors such as theft, absenteeism, and disciplinary problems. Two types exist:

- **Overt integrity tests** — directly ask about attitudes toward dishonesty and admissions of past dishonest behavior.
- **Personality-based integrity tests** — use items related to conscientiousness, agreeableness, and emotional stability without directly referencing dishonesty.

Meta-analyses show that integrity tests have moderate validity for predicting CWB (\( \rho \approx .32 \)) and modest validity for predicting overall job performance (\( \rho \approx .21 \)). They produce minimal adverse impact, making them an attractive supplement to cognitive ability tests.

---

# Chapter 10: Predictor Methods

## Overview

While the previous chapter discussed the constructs measured in selection, this chapter covers the **methods** — the specific tools and procedures used to assess candidates. The key distinction is that a single construct (e.g., interpersonal skills) can be measured by multiple methods (e.g., interview, assessment center exercise, situational judgment test), and a single method can measure multiple constructs.

## The Interview

The employment interview is the most widely used selection method worldwide. However, its effectiveness depends critically on how it is conducted.

### Unstructured Interviews

In an **unstructured interview**, the interviewer has broad latitude to ask whatever questions come to mind, follow up on responses at will, and evaluate candidates holistically. Meta-analytic research shows that unstructured interviews have relatively low validity (\( \rho \approx .20 \)) and poor inter-rater reliability. They are susceptible to:

- **First impressions** and confirmation bias.
- **Similarity bias** — preferring candidates who are similar to the interviewer.
- **Contrast effects** — evaluating candidates relative to previous interviewees rather than against a standard.
- **Halo effects** — letting one positive or negative attribute color the entire evaluation.

### Structured Interviews

<div class="definition">
A <strong>structured interview</strong> standardizes the interview process to improve reliability and validity. Key elements include:

1. Questions are <strong>based on job analysis</strong>.
2. The same questions are asked of <strong>all candidates</strong>.
3. Responses are evaluated using <strong>predetermined rating scales</strong> (anchored scoring guides).
4. Interviewers are <strong>trained</strong> in the use of the rating system.
</div>

Two common types of structured interview questions:

- **Behavioral description interviews (BDI)** — ask candidates to describe what they actually did in past situations (e.g., "Tell me about a time when you had to deal with a difficult customer.").
- **Situational interviews (SI)** — present hypothetical job-related scenarios and ask candidates what they would do (e.g., "What would you do if a coworker was not pulling their weight on a team project?").

Meta-analytic validity for structured interviews is substantially higher than for unstructured interviews (\( \rho \approx .44 \) vs. \( .20 \)), and structured interviews produce less adverse impact than cognitive ability tests.

## Assessment Centers

<div class="definition">
An <strong>assessment center</strong> is a standardized evaluation process in which candidates complete multiple exercises (simulations) designed to elicit behaviors relevant to the target job. Common exercises include:

<em>In-basket exercises</em> — managing a simulated set of memos, emails, and tasks.
<em>Group discussions</em> — solving a problem with other candidates.
<em>Role plays</em> — interacting with a trained role player in a job-related scenario.
<em>Presentations</em> — preparing and delivering a briefing or proposal.

Multiple trained assessors observe and rate candidates on predetermined competency dimensions.
</div>

Assessment centers have good criterion-related validity (\( \rho \approx .36 \) for predicting job performance, higher for predicting advancement). However, research has raised questions about their **construct validity**: ratings tend to be more strongly associated with exercises than with dimensions, suggesting that assessors may be evaluating exercise-specific performance rather than underlying competencies.

## Work Sample Tests

**Work sample tests** require candidates to perform tasks that are actual components of the job. For example, a typing test for an administrative position or a coding exercise for a software developer position. Work sample tests have high validity (\( \rho \approx .33 \)–\( .54 \)), high face validity (candidates perceive them as fair and job-related), and lower adverse impact than cognitive ability tests. Their main disadvantage is that they are expensive to develop, require job-specific knowledge, and cannot be used for entry-level positions where candidates are not expected to have the relevant skills.

## Situational Judgment Tests (SJTs)

<div class="definition">
<strong>Situational judgment tests (SJTs)</strong> present candidates with written, video-based, or computer-based descriptions of job-related situations and ask them to select the best course of action from a set of response options. SJTs can measure a variety of constructs (e.g., interpersonal skills, judgment, problem-solving) depending on their content.
</div>

SJTs have moderate validity (\( \rho \approx .26 \)), can be administered efficiently to large groups, and produce less adverse impact than cognitive ability tests. The validity of SJTs depends on the constructs they are designed to measure and the response instructions (knowledge-based: "What should you do?" vs. behavioral tendency: "What would you do?").

## Biographical Data (Biodata)

**Biographical data** (biodata) instruments collect information about candidates' past experiences, behaviors, and accomplishments through structured questionnaires. The underlying principle is that past behavior is the best predictor of future behavior. Biodata instruments have shown good validity (\( \rho \approx .35 \)) but can raise concerns about:

- **Transparency** — items may seem invasive or irrelevant.
- **Fakability** — candidates may exaggerate or fabricate experiences.
- **Fairness** — some items may reflect socioeconomic or cultural differences rather than job-relevant characteristics.

## Highhouse et al. (2019): Dark Motives and Elective Use of Brainteaser Interview Questions

<div class="remark">
Highhouse, Nye, and Zhang (2019) investigated why some interviewers persist in using <strong>brainteaser questions</strong> (e.g., "How many golf balls fit in a school bus?") despite evidence that such questions are poor predictors of job performance. They found that the use of brainteasers was associated with <strong>narcissism and sadism</strong> in interviewers — specifically, a desire to feel superior and to make candidates uncomfortable. Interviewers who scored higher on these "dark" personality traits were more likely to endorse brainteasers as valid selection tools.

This research highlights a broader theme in personnel psychology: there is often a gap between evidence-based best practices and actual organizational practice. Selection methods should be chosen based on their demonstrated validity, fairness, and practicality, not on the interviewer's personal preferences or desire for self-aggrandizement.
</div>

---

# Chapter 11: Selection Decision-Making

## Combining Predictor Information

When multiple predictors are used in selection, organizations must decide how to combine the information to make hiring decisions. There are several major approaches:

### Multiple Regression (Compensatory Model)

In a **compensatory model** (typically implemented through multiple regression), a high score on one predictor can compensate for a low score on another. Predictor scores are weighted (by their regression weights) and summed to produce a composite score, and candidates are ranked by their composite.

\[
\hat{Y} = b_1X_1 + b_2X_2 + \cdots + b_kX_k
\]

Advantages: maximizes predicted performance. Disadvantages: may allow candidates with dangerously low scores on a critical predictor to be selected.

### Multiple Cutoff (Non-Compensatory Model)

In a **multiple cutoff** approach, minimum scores are set on each predictor, and candidates must meet or exceed all cutoffs to be considered. Candidates who pass all cutoffs may then be ranked on one or more predictors or selected randomly.

Advantages: ensures minimum qualifications on all critical dimensions. Disadvantages: requires setting cutoff scores, which involves judgment and has implications for adverse impact.

### Multiple Hurdle

The **multiple hurdle** approach is a sequential, non-compensatory model in which candidates must pass each predictor stage before being assessed on the next. This approach is efficient because it allows organizations to screen out unqualified candidates early using cheaper methods (e.g., application blanks, biodata) before investing in more expensive assessments (e.g., interviews, assessment centers).

### Profile Matching

In **profile matching**, the ideal profile of predictor scores is established based on job analysis or the profiles of successful incumbents, and candidates are selected based on the similarity of their profiles to the ideal.

### Banding

<div class="definition">
<strong>Banding</strong> is a selection strategy in which candidates whose scores fall within a specified range (band) are treated as equivalent, and selection from within the band can be made on other grounds (e.g., to increase diversity). The band width is typically determined by the standard error of the difference between scores. The rationale is that candidates whose scores differ by less than the SEM may not truly differ in ability.
</div>

Banding has been controversial. Proponents argue that it acknowledges measurement error and allows organizations to pursue diversity goals without completely abandoning merit-based selection. Critics argue that it undermines the meritocratic principle and may reduce the predicted performance of the selected group.

## Adverse Impact

<div class="definition">
<strong>Adverse impact</strong> (also called disparate impact) occurs when a selection procedure results in a substantially different selection rate for members of a protected group compared to the majority group. In Canadian human rights law, adverse impact does not require proof of discriminatory intent — the focus is on the <em>effect</em> of the practice.
</div>

The **four-fifths (80%) rule** is a common guideline (originating in U.S. law but used informally in Canada): adverse impact may be indicated when the selection rate for a protected group is less than 80% of the selection rate for the majority group.

<div class="example">
<strong>Example:</strong> An organization hires 60% of White applicants and 30% of Indigenous applicants. The ratio is \( 30/60 = 0.50 \), which is below the 0.80 threshold, suggesting adverse impact. The organization would need to demonstrate that the selection procedure is a bona fide occupational requirement (BFOR).
</div>

## Strategies for Reducing Adverse Impact

Several strategies have been proposed to reduce adverse impact while maintaining validity:

1. **Use predictor composites** — combining cognitive and non-cognitive predictors (e.g., GMA + personality + structured interview) can reduce adverse impact relative to using GMA alone.
2. **Use alternative predictors** — SJTs, structured interviews, and biodata produce less adverse impact than cognitive ability tests.
3. **Banding** — treating similar scores as equivalent.
4. **Within-group norming** — comparing candidates to their own demographic group (note: this is legally prohibited in the U.S. but the Canadian legal landscape is more nuanced).
5. **Adjusting the selection ratio** — hiring more candidates from the top of the score distribution reduces the impact of group differences.

---

# Chapter 12: Legal and Ethical Issues

## The Canadian Legal Framework

Personnel selection in Canada operates within a multi-layered legal framework:

### Canadian Charter of Rights and Freedoms

Section 15(1) of the **Charter** guarantees that every individual is equal before and under the law and has the right to the equal protection and equal benefit of the law without discrimination. While the Charter applies directly only to government action, it has influenced the interpretation of human rights legislation that applies to private employers.

### Canadian Human Rights Act

The **Canadian Human Rights Act (CHRA)** prohibits discrimination in employment by federally regulated employers on the following grounds: race, national or ethnic origin, colour, religion, age, sex, sexual orientation, gender identity or expression, marital status, family status, genetic characteristics, disability, and conviction for which a pardon has been granted or a record suspension has been ordered.

Provincial and territorial human rights codes provide similar protections for provincially regulated workplaces, with some variation in the specific grounds covered.

### Employment Equity Act

The **Employment Equity Act (1995)** requires federally regulated employers and federal contractors to:

1. Identify and eliminate employment barriers against persons in four designated groups: women, Aboriginal peoples, persons with disabilities, and members of visible minorities.
2. Institute positive policies and practices to achieve a degree of representation in the workforce that reflects the representation of these groups in the Canadian workforce or in relevant segments of the workforce.
3. File annual reports on workforce composition.

Employment equity differs from affirmative action (as practiced in the U.S.) in its emphasis on systemic change and removal of barriers rather than on numerical targets or quotas.

## Bona Fide Occupational Requirement (BFOR)

<div class="definition">
A <strong>bona fide occupational requirement (BFOR)</strong> is a standard or rule that is reasonably necessary for the performance of a particular job. Under Canadian human rights law, an employer can justify a discriminatory standard by demonstrating that it is a BFOR.
</div>

The Supreme Court of Canada established the modern test for BFOR in *British Columbia (Public Service Employee Relations Commission) v. BCGSEU* (1999), commonly known as the **Meiorin decision**. The three-part test requires the employer to show:

1. **Rational connection** — the standard was adopted for a purpose rationally connected to the performance of the job.
2. **Good faith** — the standard was adopted in an honest and good-faith belief that it was necessary for the fulfilment of that legitimate work-related purpose.
3. **Reasonable necessity** — the standard is reasonably necessary to the accomplishment of that work-related purpose. The employer must show that it is impossible to accommodate the affected individual or group without imposing undue hardship on the employer.

### Duty to Accommodate

The third prong of the Meiorin test incorporates the **duty to accommodate** — the obligation of employers to make reasonable adjustments to workplace rules, policies, or conditions to eliminate or reduce the discriminatory effect on individuals with protected characteristics, short of **undue hardship**.

Factors considered in assessing undue hardship include financial cost, disruption to operations, and health and safety risks. The duty to accommodate is a fundamental principle of Canadian human rights law and has direct implications for selection: if a selection test has adverse impact on a protected group, the employer must consider whether accommodations (e.g., alternative testing formats for persons with disabilities, scheduling accommodations for religious observances) can reduce the impact.

## Ethical Considerations

Beyond legal requirements, personnel psychologists are guided by professional ethics codes, including the **Canadian Psychological Association's Canadian Code of Ethics for Psychologists** and the **SIOP Principles for the Validation and Use of Personnel Selection Procedures**. Key ethical principles include:

- **Informed consent** — candidates should understand what they are being assessed on and how the information will be used.
- **Confidentiality** — test results should be shared only with authorized decision-makers.
- **Fairness** — selection procedures should be job-related and should not unfairly disadvantage any group.
- **Competence** — personnel psychologists should work within the boundaries of their training and expertise.
- **Right to feedback** — candidates should be able to receive information about their performance on selection assessments.

## Privacy Legislation

Canadian privacy legislation — including the **Personal Information Protection and Electronic Documents Act (PIPEDA)** at the federal level and provincial equivalents — governs the collection, use, and disclosure of personal information in the employment context. Employers must:

- Collect only information that is necessary and relevant to the employment decision.
- Obtain consent for the collection and use of personal information.
- Protect personal information from unauthorized access.
- Allow individuals to access their own personal information.

These requirements affect practices such as background checks, drug testing, social media screening, and the retention of application and assessment data.

---

# Chapter 13: Recruitment

## What Is Recruitment?

<div class="definition">
<strong>Recruitment</strong> is the process of attracting a pool of qualified applicants to apply for open positions. While selection focuses on choosing among applicants, recruitment focuses on generating the applicant pool from which selections will be made. Effective recruitment is essential because even the most valid selection system cannot produce good hires if the applicant pool is weak.
</div>

## Recruitment Sources

Organizations use a variety of channels to reach potential applicants:

- **Internal recruitment** — posting positions to current employees, encouraging internal transfers and promotions. Advantages include lower cost, knowledge of the candidate's track record, and positive effects on employee motivation. Disadvantages include a limited pool and potential for inbreeding of ideas.
- **External recruitment** — job postings on websites, social media, job fairs, campus recruiting, employment agencies, professional associations, and employee referrals.
- **Employee referrals** — current employees recommend candidates from their personal networks. Research shows that referred applicants tend to have lower turnover and, in some studies, better performance than applicants from other sources, possibly because referrers provide realistic information about the job and because social networks create accountability.

## Realistic Job Previews (RJPs)

<div class="definition">
A <strong>realistic job preview (RJP)</strong> provides applicants with accurate information about both the positive and negative aspects of the job before they accept an offer. RJPs can take the form of written descriptions, videos, job shadowing, or conversations with current employees.
</div>

The theoretical rationale for RJPs is based on the **met expectations hypothesis**: when employees' pre-hire expectations match their post-hire experiences, they report higher satisfaction and are less likely to quit. By giving applicants realistic information upfront, RJPs allow those who would be a poor fit to self-select out, reducing later turnover.

Meta-analytic evidence shows that RJPs have a modest but reliable effect on reducing turnover (\( d \approx .12 \)). The effect is stronger when:

- The RJP is given early in the recruitment process.
- The RJP uses a vivid medium (e.g., video or job shadowing rather than a written brochure).
- The information is credible and specific.

## Employer Branding

**Employer branding** refers to the organization's efforts to promote itself as a desirable place to work. Drawing on marketing principles, employer branding involves communicating the organization's values, culture, benefits, and career development opportunities to potential applicants.

Research on employer branding draws on **signaling theory** — the idea that applicants use observable attributes of the organization (its reputation, recruitment practices, website quality) as signals of unobservable attributes (what it would be like to work there). Organizations that convey a clear, positive, and authentic employer brand attract more and better applicants.

## Applicant Reactions

<div class="definition">
<strong>Applicant reactions</strong> refer to candidates' perceptions of and attitudes toward the selection process. Research on applicant reactions draws heavily on <strong>organizational justice theory</strong>, distinguishing among:

<em>Distributive justice</em> — fairness of outcomes (e.g., who gets hired).
<em>Procedural justice</em> — fairness of the process (e.g., job-relatedness, consistency, opportunity to demonstrate competence).
<em>Interpersonal justice</em> — respect and dignity shown to candidates.
<em>Informational justice</em> — adequacy of explanations provided.
</div>

Research has found that applicant reactions affect:

- **Applicant withdrawal** — candidates who perceive the process as unfair are more likely to drop out.
- **Offer acceptance** — negative perceptions reduce the likelihood that selected candidates will accept job offers.
- **Organizational attractiveness** — applicants who have a positive experience are more likely to recommend the organization to others and to reapply in the future.
- **Legal challenges** — candidates who perceive unfairness may be more likely to file complaints or lawsuits.

Selection methods perceived as most fair include interviews, work sample tests, and resumes. Methods perceived as least fair include graphology, drug tests, and personality tests (although these perceptions vary across cultures and contexts).

---

# Chapter 14: Utility Analysis

## What Is Utility Analysis?

<div class="definition">
<strong>Utility analysis</strong> is a set of methods for estimating the economic value of human resource interventions, particularly selection systems. Utility analysis quantifies the return on investment (ROI) of using a valid selection procedure compared to hiring randomly or using a less valid alternative.
</div>

The basic logic of utility analysis is straightforward: if a selection system is valid, it enables the organization to hire employees who perform at a higher level than those who would be hired without the system. This improved performance has economic value that can be estimated in dollar terms.

## The Taylor-Russell Model

The **Taylor-Russell model** (Taylor & Russell, 1939) was one of the earliest approaches to utility analysis. It estimates the proportion of successful employees (those who perform above a defined criterion) as a function of three variables:

1. **Validity** (\( r_{xy} \)) — the correlation between the predictor and the criterion.
2. **Selection ratio** (\( SR \)) — the proportion of applicants who are hired.
3. **Base rate** (\( BR \)) — the proportion of applicants who would be successful if selected randomly.

The model uses the Taylor-Russell tables to determine the **success ratio** — the proportion of selected applicants who will be successful — given these three inputs.

<div class="example">
<strong>Example:</strong> If the validity is \( r = .40 \), the selection ratio is \( .20 \) (1 in 5 applicants hired), and the base rate is \( .50 \), the Taylor-Russell tables indicate a success ratio of approximately \( .78 \) — meaning 78% of hired employees will be successful, compared to the 50% that would be successful with random selection.
</div>

Key insights from the Taylor-Russell model:

- Utility increases as validity increases.
- Utility increases as the selection ratio decreases (more selective hiring).
- Utility is greatest when the base rate is moderate (around .50) — when almost everyone or almost no one would succeed, selection adds little value.

Limitations: the model requires a dichotomous criterion (success/failure) and does not estimate utility in dollar terms.

## The Brogden-Cronbach-Gleser Model

The **Brogden-Cronbach-Gleser (BCG) model** estimates the dollar value of a selection system using the following equation:

\[
\Delta U = N_s \cdot T \cdot r_{xy} \cdot SD_y \cdot \bar{z}_x - \frac{C}{p}
\]

where:

| Symbol | Meaning |
|--------|---------|
| \( \Delta U \) | Gain in utility (total dollar value) |
| \( N_s \) | Number of employees selected per year |
| \( T \) | Average tenure in years |
| \( r_{xy} \) | Validity coefficient |
| \( SD_y \) | Standard deviation of job performance in dollar terms |
| \( \bar{z}_x \) | Average standardized predictor score of those selected |
| \( C \) | Cost of testing per applicant |
| \( p \) | Selection ratio |

The critical and most controversial parameter is \( SD_y \) — the standard deviation of job performance expressed in dollars. Several estimation methods have been proposed:

- **Cost accounting** — directly measuring the dollar value of output for each employee (feasible only for some jobs).
- **The 40% rule** (Schmidt & Hunter) — estimating \( SD_y \) as 40% of the average salary for the job.
- **Global estimation** — asking supervisors to estimate the dollar value of performance at different percentile levels.

<div class="example">
<strong>Example:</strong> Suppose an organization selects 100 employees per year (\( N_s = 100 \)), with average tenure of 5 years (\( T = 5 \)), using a test with validity \( r_{xy} = .40 \), and the standard deviation of performance is \$15,000 (\( SD_y = 15{,}000 \)). If the average standardized predictor score of those selected is \( \bar{z}_x = 1.00 \) and testing costs are \$50 per applicant with a selection ratio of .20, then:

\[
\Delta U = 100 \times 5 \times .40 \times 15{,}000 \times 1.00 - \frac{50}{.20} = 30{,}000{,}000 - 250 = \$29{,}999{,}750
\]

This simplified calculation illustrates the potentially enormous economic value of valid selection, though the estimate depends heavily on assumptions about \( SD_y \).
</div>

## Practical Issues in Utility Analysis

Despite the compelling logic of utility analysis, its adoption by organizations has been limited. Several practical and conceptual issues contribute to this gap:

1. **Estimation of \( SD_y \)** — estimates vary dramatically depending on the method used, and decision-makers may distrust the resulting dollar figures.
2. **Assumptions** — the BCG model assumes linear relationships, no interactions among predictors, and stable parameters over time.
3. **Managerial skepticism** — decision-makers may find the large dollar figures produced by utility analysis implausible, leading to rejection of the analysis rather than adoption of the selection system.
4. **Sensitivity to assumptions** — small changes in input parameters can produce large changes in estimated utility.

Research has suggested that utility analysis may be more persuasive when results are presented in terms of effect sizes or productivity gains rather than raw dollar figures, and when the analysis is supplemented with other forms of evidence (e.g., face validity, stakeholder support).

## ROI of Selection Systems

More broadly, the return on investment of a selection system depends on:

- The **validity** of the system (higher validity = greater ROI).
- The **selection ratio** (more selective hiring = greater ROI per hire, but potentially higher recruitment costs to generate a larger applicant pool).
- The **cost** of the selection system relative to the value it adds.
- The **base rate** of success (selection adds more value when the base rate is moderate).
- **Tenure** (the benefits accrue for as long as the employee remains with the organization).

These factors interact, and a comprehensive analysis must consider all of them. The key takeaway is that valid selection is not just a fairness issue — it is an economic imperative. Organizations that use evidence-based selection methods gain a substantial competitive advantage through improved workforce quality.

---

# Summary and Integration

Personnel psychology provides a scientific foundation for managing the human side of organizations. The topics covered in this course — from job analysis and performance measurement to selection, legal issues, recruitment, and utility analysis — form an integrated system:

1. **Job analysis** defines what the job requires.
2. **Performance criteria** define what success looks like.
3. **Measurement principles** (reliability, validity) ensure that our tools are sound.
4. **Predictor constructs and methods** assess candidates on job-relevant attributes.
5. **Decision-making models** combine predictor information to make hiring decisions.
6. **Legal and ethical frameworks** ensure that selection is fair and compliant.
7. **Recruitment** generates the applicant pool.
8. **Utility analysis** quantifies the economic value of the system.

Each component depends on the others. A selection system built on a poor job analysis will measure the wrong things. A valid test administered unfairly will create legal liability. A brilliant selection system paired with poor recruitment will fail because the applicant pool is weak. The scientist-practitioner model — with its dual commitment to rigorous evidence and practical application — ties these elements together and provides the intellectual foundation for the field.
