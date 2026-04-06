---
title: "PHIL 422: Fairness and Anti-Discrimination in AI"
prof: "Patricia Marino"
subjects: "PHIL"
---

## Sources and References

- O'Neil, Cathy. *Weapons of Math Destruction: How Big Data Increases Inequality and Threatens Democracy*. Crown, 2016.
- Hacker, Philipp. "From Algorithmic Discrimination to Algorithmic Fairness." RAILS, 2018.
- Kleinberg, Jon, Jens Ludwig, Sendhil Mullainathan, and Cass R. Sunstein. "Discrimination in the Age of Algorithms." *Journal of Legal Analysis* 10 (2018): 113--174.
- Ajunwa, Ifeoma. "The Paradox of Automation as Anti-Bias Intervention." *Cardozo Law Review* 41 (2019): 1677--1742.
- Johnson, Gabbrielle M. "Algorithmic Bias: On the Implicit Biases of Social Technology." *Synthese* (2020).
- Prince, Anya and Daniel Schwarcz. "Proxy Discrimination in the Age of Artificial Intelligence and Big Data." *Iowa Law Review* 105 (2020): 1257--1318.
- Hellman, Deborah. "Measuring Algorithmic Fairness." *Virginia Law Review* 106 (2020): 811--866.
- Pessach, Dana and Erez Shmueli. "Algorithmic Fairness." arXiv preprint arXiv:2001.09784, 2020.
- Frye, Marilyn. "Sexism." In *The Politics of Reality: Essays in Feminist Theory*, 17--40. Crossing Press, 1983.
- Mills, Charles W. "White Supremacy as Sociopolitical System: A Philosophical Perspective." In *Whiteout: The Continuing Significance of Racism*, edited by Woody Doane and Eduardo Bonilla-Silva. Routledge, 2003.
- Vowel, Chelsea. *Indigenous Writes: A Guide to First Nations, Metis & Inuit Issues in Canada*. Portage and Main, 2016.
- Shelby, Tommie. "Race and Ethnicity, Race and Social Justice: Rawlsian Considerations." *Fordham Law Review* 72 (2004): 1697--1714.
- Mills, Charles W. "Retrieving Rawls for Racial Justice? A Critique of Tommie Shelby." *Critical Philosophy of Race* 1, no. 1 (2013): 1--27.
- Fazelpour, Sina and Zachary C. Lipton. "Algorithmic Fairness from a Non-Ideal Perspective." In *Proceedings of the AAAI/ACM Conference on AI, Ethics, and Society* (2020): 57--63.
- Chander, Anupam. "The Racist Algorithm?" *Michigan Law Review* 115 (2017): 1023--1045.
- Huq, Aziz Z. "Racial Equity in Algorithmic Criminal Justice." *Duke Law Journal* 68 (2019): 1043--1134.
- Birhane, Abeba, Elayne Ruane, Thomas Laurent, Matthew S. Brown, Johnathan Flowers, Anthony Ventresque, and Christopher L. Dancy. "The Forgotten Margins of AI Ethics." In *2022 ACM Conference on Fairness, Accountability, and Transparency*, 948--958. 2022.
- Hampton, Lelia Marie. "Black Feminist Musings on Algorithmic Oppression." arXiv preprint arXiv:2101.09869, 2021.


# Chapter 1: AI, Algorithms, and Social Justice

## The Rise of Algorithmic Decision-Making

Modern societies increasingly rely on **algorithmic decision-making** (算法决策) to allocate resources, determine eligibility, and predict behaviour across domains ranging from criminal justice to hiring, lending, and education. An **algorithm** (算法) in this context refers to any systematic procedure---often implemented through software---that takes data as input and produces a decision, score, or recommendation as output. The appeal of algorithmic systems lies in their promise of efficiency, consistency, and objectivity: whereas human decision-makers are subject to fatigue, cognitive limitations, and conscious or unconscious prejudice, algorithms can process enormous quantities of data and apply uniform criteria at scale.

Yet this promise is deeply contested. As Cathy O'Neil demonstrates in *Weapons of Math Destruction*, the very features that make algorithms attractive---their scale, opacity, and apparent neutrality---can make them potent instruments of injustice when deployed carelessly or without accountability.

## O'Neil and the Concept of Weapons of Math Destruction

O'Neil introduces the term **Weapons of Math Destruction** (数学杀伤性武器, or WMDs) to designate algorithmic systems that share three dangerous characteristics: they are **opaque** (不透明的), meaning that the people affected by them cannot understand how decisions are made; they are **scalable** (可规模化的), meaning they can be applied to millions of people simultaneously, amplifying any embedded biases; and they are **damaging** (有害的), meaning they cause concrete harm---especially to those who are already marginalized or disadvantaged.

<div class="definition">
<strong>Weapon of Math Destruction (WMD):</strong> A mathematical model or algorithm that is opaque, scalable, and damaging, and that encodes prejudice, misunderstanding, or bias into software systems that increasingly manage human lives. The three features are mutually reinforcing: opacity prevents accountability, scale magnifies harm, and the resulting damage is borne disproportionately by those least able to contest it.
</div>

### The Three Key Features in Detail

**Opacity** is the first and most philosophically significant feature. Opacity means that neither the people subject to algorithmic decisions nor the public institutions that oversee them can examine the model's inner workings. A defendant sentenced partly on the basis of a risk score cannot learn why the score is high. A job applicant rejected by an automated screening tool receives no explanation. Opacity forecloses the possibility of contest, appeal, or improvement. It also enables those who benefit from the algorithm's outputs to disclaim responsibility for its harms: the system made the decision, not the human operator.

**Scale** transforms a flawed model from a local problem into a systemic one. A biased human hiring manager can harm dozens of candidates per year; a biased automated hiring algorithm can harm millions. O'Neil's central insight is that scale does not merely multiply existing harms---it qualitatively changes their character. When enough people are subjected to the same flawed model simultaneously, the result is a systematic restructuring of life chances across an entire population.

**Damage** is the criterion that distinguishes a WMD from a merely imperfect algorithm. Not every algorithm that produces errors is a WMD. An algorithm that optimizes the scheduling of delivery trucks may be inaccurate but causes little damage. WMDs are those whose errors hurt people: the person wrongly denied parole, the teacher wrongly fired, the loan applicant wrongly judged uncreditworthy. And crucially, the people who are hurt are rarely those who designed, deployed, or profit from the algorithm.

### Specific Examples from *Weapons of Math Destruction*

**Recidivism scoring** is O'Neil's paradigmatic case. Tools like COMPAS produce risk scores predicting the likelihood that a defendant will reoffend, scores that inform bail and sentencing decisions. O'Neil argues that these tools are WMDs: the scoring methodology is proprietary and opaque; the same model is applied to hundreds of thousands of defendants; and an incorrectly high score can result in years of unjust detention. The model uses inputs like employment history, residential stability, and responses to attitude surveys---all of which correlate with race---to predict behaviour while ostensibly not using race.

**Teacher evaluation models** provide a second case study. In the years following the No Child Left Behind Act, many US school districts adopted **value-added models** (增值模型) to evaluate teacher effectiveness based on student test score gains. O'Neil documents the case of a Washington, DC teacher who received an excellent evaluation one year and was rated among the worst performers the next, with no change in her actual teaching. The model's volatility---caused by its technical design, not by any real variation in teacher quality---destroyed careers while operating in complete opacity. Teachers could not appeal because they could not understand the model, let alone identify its errors.

**Insurance pricing** rounds out the picture. Insurers in the United States increasingly use algorithmic pricing models that incorporate credit scores, shopping behaviour, and other proxies to determine premiums. O'Neil demonstrates that these models systematically charge higher premiums to poor customers, who tend to have lower credit scores not because they are riskier drivers but because of unrelated financial pressures. The algorithm thus extracts higher payments from those least able to afford them, concentrating economic harm in communities already experiencing financial precarity.

## The Feedback Loop Problem

One of O'Neil's most powerful arguments concerns **pernicious feedback loops** (恶性反馈循环): the way WMDs do not merely reflect existing inequality but actively entrench and deepen it. The mechanism is straightforward but devastating in its implications.

Consider a predictive policing algorithm trained on historical arrest data. If past policing concentrated on certain neighbourhoods---often due to racial profiling---the algorithm will direct future policing resources to those same areas. More police in those areas means more arrests there, which generates more data confirming the algorithm's prediction that crime is concentrated in those areas. The model does not detect crime; it detects policing patterns, and it uses those patterns to intensify the policing. The result is a self-reinforcing cycle that deepens residential criminalization while wearing the mask of mathematical objectivity.

The same dynamic operates in credit markets. An applicant from a low-income neighbourhood is scored as a poor credit risk partly because her neighbours have historically defaulted at higher rates. If she is denied credit, she cannot invest in education or business development that might raise her income. Her financial situation stagnates or worsens. Next year's model will rate her even more poorly. The algorithm does not merely measure poverty; it perpetuates it.

O'Neil contrasts this with the **virtuous cycle** (良性循环) available to those who receive positive algorithmic assessments. A high credit score produces access to low-interest loans, which produces stable finances, which produces an even higher credit score. The same structural logic that traps the poor in disadvantage propels the already-advantaged further ahead. WMDs thus function as mechanisms of **cumulative disadvantage** (累积性不利), systematically widening the gap between those who benefit from algorithmic systems and those who are harmed by them.

## Automation Bias

A further problem O'Neil identifies---and that has been extensively studied in the psychology and HCI literatures---is **automation bias** (自动化偏见): the tendency of human operators to over-trust algorithmic outputs and to defer to them even when common sense or direct observation would suggest a different conclusion.

When a judge is presented with a risk score of 8.5 out of 10 for a defendant, the precision of the number creates a powerful impression of certainty. The score appears objective, scientific, and authoritative in a way that a colleague's verbal assessment would not. Research shows that humans systematically overweight such quantitative outputs and underweight their own contextual knowledge and moral judgment. The algorithmic score becomes a social fact that is difficult to contest, not because it is accurate, but because contesting it requires challenging the authority of a system that is opaque and ostensibly scientific.

Automation bias has several practical consequences. It reduces the effective accountability of algorithmic systems: if human operators simply defer to algorithmic outputs, then in practice there is no human check on the algorithm's decisions. It shifts moral responsibility in ways that benefit those who deploy the system: when things go wrong, the algorithm is blamed, not the humans who built it, deployed it, and refused to override it. And it concentrates the costs of algorithmic error on those who lack the social capital to challenge technical authority---typically the same marginalized communities who are most often subjected to harmful algorithmic decisions.

## Pasquale's Black Box Society

Frank Pasquale's *The Black Box Society* (2015) offers a complementary analysis that deepens O'Neil's critique. Where O'Neil focuses primarily on the harms of specific algorithmic systems, Pasquale is concerned with the broader **political economy of algorithmic opacity** (算法不透明性的政治经济学).

Pasquale's central argument is that the opacity of algorithmic systems is not accidental but structural: it reflects and reinforces asymmetries of power between the corporations that deploy algorithms and the individuals and communities subject to them. Banks, insurers, employers, and government agencies know everything about us; we know almost nothing about how they make the decisions that shape our lives. This asymmetry is, on Pasquale's analysis, a form of power---the power to see without being seen, to judge without being judged.

<div class="definition">
<strong>Black Box Society:</strong> A social order in which consequential decisions about individuals and communities are made by opaque automated systems whose inner workings are inaccessible to those affected, creating radical asymmetries of information and power between the institutions that deploy algorithmic systems and the people subject to them.
</div>

Pasquale argues that the remedy requires not just better algorithms but democratic accountability: algorithmic systems that exercise public power should be subject to public scrutiny. The opacity that currently shields corporate and governmental algorithms from accountability is a political choice, not a technical necessity, and challenging it requires political mobilization, not merely technical improvement.

Together, O'Neil's and Pasquale's analyses establish a foundational claim for this course: algorithmic systems are not neutral technical tools but political instruments, and their fairness cannot be assessed in isolation from the social, economic, and political structures in which they operate.

## Hacker: From Algorithmic Discrimination to Algorithmic Fairness

Philipp Hacker provides a legal and regulatory perspective on algorithmic discrimination. He identifies two primary sources of **algorithmic bias** (算法偏见): biased training data and proxy discrimination. When AI systems learn from historical data that reflects prior human prejudices, they reproduce and even amplify those prejudices. Hacker illustrates this with cases such as Google's image recognition system, which in 2015 labelled photographs of Black individuals as "gorillas," and the COMPAS recidivism prediction tool, which was found to produce racially disparate false-positive rates.

Hacker proposes a framework that combines **anti-discrimination law** (反歧视法) with the enforcement mechanisms of **data protection law** (数据保护法), particularly the European Union's General Data Protection Regulation (GDPR). His central recommendation is an **equality-by-design** (平等设计) approach, analogous to the established concept of privacy-by-design: fairness constraints should be built into algorithmic systems from the outset rather than addressed as an afterthought. This means incorporating algorithmic fairness procedures directly at the model level, using technical tools to detect and correct for discriminatory patterns before deployment.

<div class="remark">
<strong>Remark:</strong> Hacker's proposal highlights a fundamental tension in the regulation of algorithmic systems: anti-discrimination law traditionally requires showing discriminatory intent or disparate impact after the fact, whereas algorithmic systems require proactive design interventions before deployment. The shift from reactive to proactive regulation is one of the defining challenges in AI governance.
</div>

## The Broader Landscape: Utilitarianism, Fairness, and Discrimination

The course situates algorithmic fairness within the broader tradition of **political philosophy** (政治哲学). Classical **utilitarianism** (功利主义) evaluates actions and policies by their aggregate consequences: the right action is the one that maximizes overall welfare. When applied to algorithmic decision-making, a utilitarian approach might endorse any algorithm that maximizes predictive accuracy or efficiency, even if it produces disparate outcomes for different groups, so long as aggregate welfare is increased.

Critics of utilitarianism have long argued that such an approach ignores considerations of **fairness** (公平) and **discrimination** (歧视). Algorithmic systems that maximize overall accuracy may do so at the expense of vulnerable minorities, generating what political philosophers call **distributive injustice** (分配不公). The philosophical challenge is to articulate principles of fairness that can constrain the pursuit of efficiency---and to operationalize those principles in algorithmic design. This challenge animates the entire course.


# Chapter 2: Discrimination in the Age of Algorithms

## The Legal Framework: Disparate Treatment and Disparate Impact

Before examining Kleinberg et al.'s arguments, it is essential to understand the legal landscape of anti-discrimination law in the United States, because algorithmic systems both operate within that landscape and expose its limitations.

American anti-discrimination law, primarily under Title VII of the Civil Rights Act of 1964, the Fair Housing Act, and the Equal Credit Opportunity Act, recognizes two distinct theories of discrimination.

**Disparate treatment** (差别对待) is intentional discrimination: treating a person less favourably because of their membership in a protected class (race, sex, national origin, religion, colour). To establish a disparate treatment claim, the plaintiff must show that the defendant acted *because of* the protected characteristic. Discriminatory intent is the central element. This framework is well-suited to cases where an employer explicitly refuses to hire women or where a landlord refuses to rent to Black applicants. It is poorly suited to algorithmic discrimination, where no human need form a discriminatory intent for a discriminatory outcome to occur.

**Disparate impact** (差别影响) is a more powerful doctrine for the algorithmic context. Established by the Supreme Court in *Griggs v. Duke Power Co.* (1971) and codified in the Civil Rights Act of 1991, disparate impact allows plaintiffs to challenge facially neutral practices that disproportionately harm members of a protected class, *without* proving intent. A facially neutral employment test that disqualifies Black applicants at a higher rate than white applicants may constitute unlawful discrimination even if the employer had no discriminatory intent, unless the employer can show that the test is justified by business necessity.

<div class="definition">
<strong>Disparate Treatment (差别对待):</strong> Intentional discrimination against a person because of their membership in a protected class. The plaintiff must show discriminatory motivation. <strong>Disparate Impact (差别影响):</strong> A facially neutral practice that disproportionately harms members of a protected class. No intent need be shown; the plaintiff establishes a statistical disparity, and the burden then shifts to the defendant to justify the practice as a business necessity.
</div>

### The Failure of These Standards in Algorithmic Contexts

Both legal doctrines face significant challenges when applied to algorithmic systems. Disparate treatment doctrine requires proof of discriminatory intent, which is nearly impossible to establish when bias emerges from data patterns rather than human decisions. A company that deploys a biased hiring algorithm can truthfully say that no one intended to discriminate.

Disparate impact doctrine is more promising but also encounters difficulties. First, plaintiffs must identify the specific employment practice causing the disparity. With complex algorithmic systems, isolating the contribution of any particular feature or model component is technically difficult. Second, the business necessity defence is broad and difficult to overcome: if an algorithm is more predictive than available alternatives, courts may accept this as a business necessity even if the algorithm produces significant racial disparities. Third, many algorithmic systems are deployed by government agencies, and disparate impact doctrine does not apply to constitutional equal protection claims against the government, which still requires proof of discriminatory intent under *Washington v. Davis* (1976).

### Connecting Legal Standards to Algorithmic Fairness Metrics

The legal dichotomy between disparate treatment and disparate impact maps, imperfectly, onto the technical distinction between **individual fairness** and **group fairness** in the algorithmic fairness literature. Disparate treatment doctrine is concerned with whether an individual was treated differently because of a protected characteristic---analogous to individual fairness. Disparate impact doctrine is concerned with whether a practice produces disproportionate group-level outcomes---analogous to group fairness metrics such as demographic parity.

Kleinberg et al.'s impossibility theorems (discussed below) show that satisfying disparate impact standards (demographic parity) simultaneously with accuracy-based standards (calibration) is mathematically impossible when base rates differ across groups. This result has direct legal significance: it implies that courts and regulators must make normative choices about which legal standard to prioritize, and these choices cannot be avoided by appeals to technical neutrality.

## Kleinberg et al.: Algorithms as Tools for Transparency

Jon Kleinberg, Jens Ludwig, Sendhil Mullainathan, and Cass Sunstein advance a provocative thesis: contrary to widespread concern, the age of algorithms can actually make it *easier* to detect and prove discrimination. Their argument begins from the observation that human decision-making is notoriously opaque. When a hiring manager rejects a candidate, it is often impossible to determine whether the decision was motivated by legitimate considerations, unconscious bias, or deliberate prejudice. People may not be aware of their own biases, and even when they are, they can easily dissemble.

Algorithms, by contrast, require **explicitness** (明确性). An algorithm must be given a defined objective function, a specified set of input variables, and a transparent set of rules for combining them. This very specificity, Kleinberg et al. argue, creates new opportunities for scrutiny. One can examine which variables the algorithm uses, test whether protected characteristics or their proxies influence outputs, and compare outcomes across groups in ways that are simply impossible with human decision-makers.

### The Transparency Argument

The authors identify several dimensions along which algorithms provide transparency unavailable in human decision-making:

1. **Input transparency**: We can know exactly which variables the algorithm considers and which it does not.
2. **Process transparency**: We can examine the rules or learned parameters that map inputs to outputs.
3. **Output transparency**: We can systematically compare outcomes across demographic groups and conduct counterfactual analyses.

This transparency makes it possible, in principle, to subject algorithmic decisions to rigorous anti-discrimination scrutiny. If an algorithm produces worse outcomes for one racial group, we can investigate precisely which inputs and which aspects of the model are responsible, and we can test counterfactual scenarios in which group membership is varied while other factors are held constant.

### The Kleinberg et al. Impossibility Theorems

Beyond the transparency argument, Kleinberg et al. establish formal impossibility results that connect directly to the legal standards discussed above. They prove that under realistic conditions---specifically, when the base rate of the predicted outcome differs across demographic groups---it is mathematically impossible for an algorithm to simultaneously satisfy:

1. **Demographic parity**: Equal positive prediction rates across groups.
2. **Equalized odds**: Equal true positive and false positive rates across groups.
3. **Calibration**: The same positive predictive value across groups (a score of 0.7 means 70% risk for all groups).

This result, independently derived by Chouldechova (2017) and Kleinberg, Mullainathan, and Raghavan (2016), means that legal standards requiring demographic parity (a disparate impact test) and legal standards requiring calibration (an accuracy-based defence) are in irreducible conflict when the underlying recidivism rates differ between racial groups. Any algorithm that satisfies one criterion will necessarily violate the other.

<div class="remark">
<strong>Remark:</strong> The impossibility theorem does not tell us which fairness criterion to choose; it tells us that the choice is unavoidable. This is a philosophical and legal problem, not a technical one. The mathematics reveals the shape of the dilemma but cannot resolve it. Resolution requires deciding what justice demands in the specific context---a decision that lies beyond the reach of algorithms.
</div>

### The COMPAS Case Study

The most prominent real-world illustration of these issues is the COMPAS (Correctional Offender Management Profiling for Alternative Sanctions) recidivism risk assessment tool, developed by Northpointe (now Equivant). COMPAS produces a score from 1 to 10 predicting the likelihood that a defendant will reoffend within two years, and this score is used by judges in bail and sentencing decisions in numerous US jurisdictions.

In May 2016, the investigative news organization ProPublica published an analysis of COMPAS scores for approximately 7,000 defendants in Broward County, Florida. ProPublica's central finding was that COMPAS produced systematically higher **false positive rates** (假阳性率) for Black defendants than for white defendants: Black defendants who did not go on to reoffend within two years were nearly twice as likely as similarly situated white defendants to be classified as high-risk. At the same time, white defendants who did go on to reoffend were more likely than Black defendants to be classified as low-risk---a higher **false negative rate** (假阴性率) for white defendants.

Northpointe responded by pointing out that COMPAS was in fact *calibrated*: among defendants receiving any given risk score, Black and white defendants reoffended at approximately equal rates. A score of 7 meant roughly the same probability of reoffending regardless of race. Northpointe argued that calibration is the appropriate standard of fairness for a risk prediction tool.

The disagreement between ProPublica and Northpointe is not a factual dispute but a normative one---and it is precisely the disagreement predicted by the impossibility theorem. Because Black defendants in Broward County had higher observed recidivism rates (partly reflecting over-policing and other structural factors), a calibrated model will necessarily assign higher scores to Black defendants and will therefore produce higher false positive rates for Black defendants than for white defendants. You can have calibration or equal false positive rates, but not both when base rates differ.

<div class="example">
<strong>Example --- The COMPAS Disagreement:</strong> Imagine two defendants, one Black and one white, both scored 7 out of 10 by COMPAS. In a calibrated model, both face approximately the same probability of reoffending. But because Black defendants receive high scores more often (due to higher base rates in the training data), a Black defendant with a score of 7 is more likely to be a false positive---someone who will not actually reoffend---than a white defendant with the same score. Whether this constitutes discrimination depends entirely on which fairness standard one adopts, and the impossibility theorem shows that no algorithm can satisfy both standards simultaneously.
</div>

### Algorithms as a Positive Force

Kleinberg et al. do not deny that algorithms can discriminate. Their point is rather that algorithmic discrimination is more *detectable* than human discrimination, and that with appropriate legal and regulatory safeguards, algorithms can become a positive force for equity. The key is to ensure that the transparency algorithms make possible is actually exploited through appropriate oversight mechanisms.

<div class="remark">
<strong>Remark:</strong> Kleinberg et al.'s optimistic assessment depends on the assumption that algorithmic transparency is genuine---that the relevant features of the model are in fact accessible to scrutiny. This assumption is more plausible for simple linear models than for complex neural networks, where the relationship between inputs and outputs may be highly non-linear and difficult to interpret. The problem of <strong>algorithmic opacity</strong> (算法不透明性) in deep learning models complicates their argument considerably.
</div>

## Ajunwa: The Paradox of Automation as Anti-Bias Intervention

Ifeoma Ajunwa presents a direct challenge to the view that automation inherently reduces discrimination. Her thesis centres on a fundamental **paradox** (悖论): while algorithmic decision-making is often adopted precisely as an anti-bias intervention---on the theory that removing humans from the decision loop will eliminate human prejudice---in practice, automated systems frequently replicate and even amplify existing biases.

### The Hiring Context

Ajunwa focuses on algorithmic hiring as a case study. Employers increasingly use automated resume screening, personality assessments, and predictive analytics to select candidates, often justified on the grounds that such tools will produce fairer outcomes than human recruiters. Ajunwa identifies several mechanisms by which this promise fails:

1. **Biased training data**: Algorithmic hiring tools are trained on historical hiring data that reflects past discrimination. If a company has historically hired few women for technical roles, the algorithm will learn to penalize features associated with female candidates.

2. **Nebulous criteria**: Concepts like "cultural fit" are inherently vague and can serve as vectors for bias. When translated into algorithmic features, they may operationalize stereotypes while appearing neutral.

3. **Legal deference**: American employment law has traditionally given employers wide latitude in defining job qualifications and selection criteria, making it difficult to challenge algorithmic hiring decisions even when they produce discriminatory outcomes.

### Beyond the Technical Fix

Ajunwa argues that framing algorithmic bias as a purely **technical problem** (技术问题) is fundamentally misguided. The bias is not merely a bug to be fixed through better engineering; it is the product of systemic social inequalities that are encoded in data and amplified by automated systems. The solution, she argues, requires not just technical interventions but legal reform: employers should bear liability for the discriminatory effects of their automated systems, and failure to audit algorithmic hiring platforms for **disparate impact** (差别影响) should constitute prima facie evidence of discriminatory intent.

<div class="example">
<strong>Example --- Amazon's Hiring Algorithm:</strong> In 2018, Amazon reportedly scrapped an AI recruiting tool after discovering that it systematically downgraded resumes that included the word "women's" (as in "women's chess club captain") and penalized graduates of all-women's colleges. The system had been trained on resumes submitted over a ten-year period, during which the company's technical workforce was predominantly male. The algorithm learned that maleness was a predictor of hiring success and penalized markers of femaleness accordingly.
</div>

### The Paradox Stated

The paradox, precisely stated, is this: the very conditions that motivate the adoption of algorithmic decision-making---the pervasiveness of human bias---also ensure that the data on which algorithms are trained is itself biased. Automation does not escape bias; it inherits it. And because automated systems operate at scale and with an aura of objectivity, they can entrench bias more deeply and more invisibly than the human decision-makers they replace.


# Chapter 3: Proxy Discrimination

## Johnson: Algorithmic Bias as Implicit Bias

Gabbrielle Johnson draws an innovative parallel between **algorithmic bias** and **implicit bias** (内隐偏见) in human cognition. Drawing on research in philosophy of mind and cognitive science, she argues that the two phenomena share a common structure: in both cases, biases emerge from seemingly innocuous patterns of information processing, and their emergent nature makes them difficult to identify, mitigate, or evaluate using standard conceptual resources.

### The Proxy Problem

Johnson's central contribution is what she calls **the Proxy Problem** (代理变量问题). Both human cognizers and machine learning algorithms rely on proxy attributes---features that are statistically correlated with the target of prediction but that also correlate with socially sensitive characteristics like race or gender. Consider an algorithm that uses zip code to predict creditworthiness: zip code may be a genuinely useful predictor, but it also serves as a proxy for race because of residential segregation.

<div class="definition">
<strong>Proxy Attribute (代理属性):</strong> A variable that is facially neutral but that correlates with a protected characteristic (such as race or gender) in such a way that relying on it produces discriminatory outcomes. Proxy attributes create a fundamental dilemma: removing them may reduce accuracy, but retaining them perpetuates bias.
</div>

The Proxy Problem generates a dilemma that admits of no purely algorithmic solution. Attempts to discourage reliance on proxy attributes risk a tradeoff with judgment accuracy: removing zip code from a credit model may make the model less predictive for everyone, while retaining it perpetuates racial disparities. This tradeoff is not merely a technical challenge but a normative one, requiring value judgments about how to balance accuracy against equity.

## Ajunwa: "Neutral" Criteria as Race and Gender Proxies

Ifeoma Ajunwa's analysis of algorithmic hiring provides rich documentation of how criteria that appear facially neutral function in practice as proxies for race and gender. Her account extends the proxy problem analysis beyond zip codes to the full range of features modern hiring algorithms deploy.

Ajunwa identifies names as a particularly significant proxy. Research in audit studies (notably the famous Bertrand and Mullainathan study, "Are Emily and Greg More Employable than Lakisha and Jamal?") demonstrates that resumes with stereotypically Black names receive significantly fewer callbacks than identical resumes with stereotypically white names. An automated system trained on callback rates will learn to treat name-associated signals as predictors of success, effectively encoding racial discrimination into a "neutral" criterion.

Similarly, educational institution names function as proxies. Historically Black Colleges and Universities (HBCUs) produce graduates who are on average just as qualified as graduates of predominantly white institutions, but an algorithm trained on historical hiring outcomes---where HBCU graduates faced discrimination---will learn to downweight HBCU credentials. The algorithm treats institutional affiliation as predictive of job performance when in fact it is predictive of historical discrimination.

<div class="example">
<strong>Example --- Zip Code as Race Proxy:</strong> A credit-scoring algorithm that uses residential zip code as a feature will assign lower scores to applicants from predominantly Black or Latino neighbourhoods. This correlation between zip code and race is not coincidental: it is the direct product of decades of racially discriminatory housing policy, including redlining (discussed below), exclusionary zoning, and racially targeted predatory lending. The algorithm does not use race; it uses the spatial footprint of racism.
</div>

## Redlining and Its Digital Successor

The history of **redlining** (红线政策) is essential context for understanding digital proxy discrimination. Beginning in the 1930s, the Home Owners' Loan Corporation (HOLC), a New Deal-era federal agency, created residential security maps of American cities that colour-coded neighbourhoods by perceived investment risk. Neighbourhoods populated predominantly by Black residents, immigrants, or the poor were coloured red and rated "hazardous." Banks and federal mortgage insurers used these maps to deny mortgages and investment to redlined areas, systematically preventing Black families from accumulating housing wealth.

The effects of redlining persist: studies have shown that HOLC-redlined neighbourhoods remain significantly poorer, less healthy, and less educated than neighbourhoods that received higher ratings, even seventy years later. The spatial structure of racial inequality that redlining created is now encoded in the data that algorithmic systems use.

**Digital redlining** is the contemporary practice of using proxies that track the spatial and social footprint of historical redlining to produce similar exclusionary effects. An insurance pricing algorithm that charges higher premiums to residents of formerly redlined neighbourhoods is not legally discriminating by race---no one's race appears in the model---but it is producing outcomes that are racially discriminatory in origin and effect. The digital form is more insidious than the original: it is hidden within complex models, protected by trade-secret law, and legitimated by the apparent objectivity of data-driven methods.

## Prince and Schwarcz: A Framework for Impermissible Proxy Use

Anya Prince and Daniel Schwarcz build a systematic legal framework for identifying when proxy discrimination is impermissible. Their central insight is that not all use of correlated variables constitutes wrongful discrimination, and the challenge is to identify the conditions under which it does.

Prince and Schwarcz distinguish three types of correlation between a facially neutral variable and a protected characteristic:

1. **Causally proximate correlation**: The protected characteristic directly causes variation in the variable (e.g., race directly causes differential access to wealth-building opportunities). Using such a variable is more likely to constitute wrongful discrimination because the protected characteristic is embedded in the causal story.

2. **Causally distal correlation**: The correlation is mediated by many intervening causal factors (e.g., credit score correlates with race because of a long causal chain involving historical discrimination, but the correlation is not due to any direct causal relationship). Using such variables may or may not constitute wrongful proxy discrimination depending on context.

3. **Spurious correlation**: The correlation holds in the training data but does not reflect any genuine underlying causal relationship; it is an artefact of biased data collection or historical contingency.

### When Proxy Use Is Impermissible

Prince and Schwarcz propose that proxy use is impermissible when (a) the variable correlates substantially with a protected characteristic, (b) the correlation derives substantially from historical discrimination rather than from legitimate variation in the predicted outcome, and (c) alternative variables exist that would allow comparable predictive accuracy without the discriminatory proxy effect.

This framework is more nuanced than a simple prohibition on correlated variables. It acknowledges that some correlations between neutral variables and protected characteristics are legitimate (e.g., language proficiency may correlate with national origin but also be a genuine qualification for certain roles) while identifying conditions under which the use of such correlations constitutes unjustifiable proxy discrimination.

### The Disparate Impact vs. Proxy Discrimination Distinction

Prince and Schwarcz draw a conceptual distinction between **disparate impact** and **proxy discrimination** that is important for both legal and philosophical analysis. **Disparate impact** is the broader category: any facially neutral practice that produces disproportionate harm to a protected class. **Proxy discrimination** is a subset of disparate impact: it occurs when a facially neutral practice produces disparate impact *and* the predictive usefulness of that practice derives substantially from the very correlation with the protected characteristic that generates the disparate impact.

This distinction matters because it affects the appropriate remedy. For generic disparate impact, the question is whether the practice is justified by business necessity. For proxy discrimination, the question is sharper: the practice derives its value *from* the discriminatory correlation, which means that justifying it by that value is essentially justifying discrimination by its discriminatory effectiveness.

<div class="remark">
<strong>Remark:</strong> This analysis reveals a deep irony: the legal prohibition on using protected characteristics in decision-making, which was designed to prevent discrimination, can actually exacerbate proxy discrimination in the algorithmic context. By forcing algorithms to use proxies instead of the characteristic itself, the prohibition makes discrimination harder to detect while doing nothing to eliminate it.
</div>

## The Statistical Discrimination Literature

The proxy discrimination problem has roots in a longstanding economic literature on **statistical discrimination** (统计性歧视), pioneered by Kenneth Arrow in the 1970s. Arrow's framework distinguishes two types of rational employer behaviour:

**Taste-based discrimination** (趣味性歧视): An employer discriminates because of a personal aversion to certain groups, paying a wage premium to preferred workers. This form of discrimination is inefficient and should be competed away in a competitive market (though historical evidence suggests it is not).

**Statistical discrimination**: An employer uses group membership as an inexpensive proxy for information about individual productivity that would be costly to observe directly. If, on average, group A has higher productivity than group B, a rational profit-maximizing employer will prefer group A members even when no information about the individual is available. This discrimination can persist even without any animus.

### Normative Problems with Statistical Discrimination

Arrow's framework was intended descriptively, but it has important normative implications that have been extensively debated. Statistical discrimination is normatively problematic for several reasons:

First, it treats individuals as representatives of group averages rather than as individuals with their own particular characteristics. A job applicant rejected because his group has, on average, lower measured productivity is harmed by being evaluated on the basis of characteristics he does not possess. This is a paradigm violation of the principle that individuals should be judged on their own merits.

Second, statistical discrimination is self-perpetuating: if members of group B are denied investment and opportunity because they are stereotyped as less productive, they will in fact become less productive (through the mechanism of reduced human capital investment). The stereotype becomes self-fulfilling. Arrow's own analysis recognized this dynamic.

Third, the "statistical" character of such discrimination provides a cloak of rationality that shields it from moral criticism. If the group averages are real (even if produced by discrimination), the employer can claim to be acting rationally and on the basis of accurate information. This claim is technically correct while being morally evasive.

## Proxy Discrimination Across Domains

Proxy discrimination is not limited to employment and credit. It operates across the full range of domains in which algorithmic systems are deployed.

**Credit scoring**: FICO and similar credit scores aggregate payment history, debt levels, length of credit history, and other financial variables into a single number. These variables are not racially neutral: they reflect the effects of historical discrimination in housing, employment, and lending. Research by the National Community Reinvestment Coalition has documented that credit scores systematically underestimate the creditworthiness of Black and Latino borrowers by failing to incorporate alternative data (such as rent payment history) that would be more predictive for those historically excluded from traditional credit markets.

**Hiring algorithms**: As documented by Ajunwa and others, name, educational institution, zip code, employment gaps (correlated with caregiving responsibilities and thus with gender), and social media activity all function as proxies for protected characteristics in automated hiring systems.

**Targeted advertising**: Facebook's advertising platform was found by ProPublica and others to permit advertisers to exclude users from seeing ads for housing, credit, and employment based on characteristics correlated with race. Because Facebook's categories (such as "Multicultural Affinity: African-American") were derived from user behaviour rather than stated race, advertisers could engage in racial targeting while claiming not to use race. Facebook settled a lawsuit with the National Fair Housing Alliance in 2019 and agreed to restructure its advertising system.


# Chapter 4: Defining and Measuring Algorithmic Fairness

## Formal Fairness Metrics

The algorithmic fairness literature has developed a precise mathematical vocabulary for specifying what it means for an algorithm to treat groups equitably. Let *A* denote the protected attribute (e.g., race: 0 = white, 1 = Black), *Y* the true outcome (e.g., 1 = will reoffend, 0 = will not reoffend), and *Ŷ* the algorithm's predicted outcome or classification. Let *S* denote a continuous score (e.g., a risk score from 1 to 10).

The three most widely discussed fairness metrics are:

| Fairness Metric | Formal Definition | Intuition |
|---|---|---|
| **Demographic Parity** | P(Ŷ = 1 \| A = 0) = P(Ŷ = 1 \| A = 1) | Both groups receive positive predictions at equal rates |
| **Equalized Odds** | P(Ŷ = 1 \| Y = y, A = 0) = P(Ŷ = 1 \| Y = y, A = 1) for y ∈ {0,1} | Equal true positive rates *and* equal false positive rates across groups |
| **Calibration / Predictive Parity** | P(Y = 1 \| S = s, A = 0) = P(Y = 1 \| S = s, A = 1) | A score of *s* means the same probability of the outcome for both groups |

**Demographic parity** (人口统计均等) is the simplest and most direct equity criterion: both groups should be selected, classified, or approved at the same rate. It is the closest analogue to a disparate impact standard in anti-discrimination law. Its limitation is that it does not condition on actual outcomes---a fully accurate algorithm could violate demographic parity if the true rates of the predicted behaviour differ across groups.

**Equalized odds** (均等机会), introduced by Hardt, Price, and Srebro (2016), is more demanding: it requires both equal true positive rates (both groups equally benefit from correct positive classifications) and equal false positive rates (both groups bear the same burden of incorrect positive classifications). In the recidivism context, equalized odds would require that the probability of being classified as high-risk is the same for those who will reoffend *and* the probability of being incorrectly classified as high-risk is the same for those who will not reoffend, across racial groups.

**Calibration** (校准) / predictive parity requires that the meaning of a score be the same for all groups: a risk score of 7 should mean a 70% probability of reoffending whether the defendant is Black or white. This is the standard Northpointe used to defend COMPAS.

## The Chouldechova/Kleinberg Impossibility Theorem

Alexandra Chouldechova (2017) and Kleinberg, Mullainathan, and Raghavan (2016), working independently, proved the central impossibility result that structures the entire algorithmic fairness debate.

**Theorem (informal):** If the base rates of the predicted outcome differ between groups (P(Y = 1 | A = 0) ≠ P(Y = 1 | A = 1)), then no non-trivial algorithm can simultaneously satisfy demographic parity, equalized odds, and calibration.

Chouldechova's version of the result applies specifically to recidivism prediction and shows that if a classifier is calibrated and has unequal prevalence across groups, then it must have unequal false positive rates and/or false negative rates---precisely the disagreement between ProPublica and Northpointe.

The impossibility theorem reveals that the choice among fairness metrics is irreducibly normative. The question "which fairness metric should we use?" cannot be answered by mathematics; it requires a substantive moral and political judgment about what we owe to different groups in the specific decision context. In the bail context, one might argue that the harm of a false positive (incorrectly detaining an innocent person) is more severe than the harm of a false negative (incorrectly releasing someone who will reoffend), which would favour equalized false positive rates over calibration.

## The Ground Truth Problem

A subtler issue in recidivism prediction---one that undermines the entire enterprise in a more fundamental way---is what philosophers and statisticians call the **ground truth problem** (基准真相问题).

Recidivism prediction algorithms are evaluated against a ground truth: did the defendant reoffend? But the data used to answer this question is not neutral. "Reoffending" in the dataset means "being arrested again for a new crime." But arrest rates are themselves shaped by policing practices. Communities that are more heavily policed will generate more arrests, even if the underlying rate of criminal behaviour is the same as in less-policed communities.

This creates a fundamental circularity: the algorithm predicts the probability of arrest, using historical arrest rates as the training signal. It is then evaluated against future arrest rates. The entire system is circular with respect to the quantity it purports to measure---actual criminal behaviour---because actual criminal behaviour is never directly observed. Only policing-mediated arrest is observed. An algorithm that is highly accurate in predicting future arrests may be highly accurate in predicting future policing rather than future crime.

<div class="definition">
<strong>Ground Truth Circularity (基准真相循环):</strong> The problem that arises when the outcome variable used to train and evaluate a predictive algorithm is itself a product of the social processes the algorithm is supposed to predict. In recidivism prediction, arrest rates are used as proxies for criminal behaviour, but arrest rates reflect policing practices that are themselves racially biased, creating a self-referential system that predicts policing rather than crime.
</div>

## Hellman: Conceptual Foundations of Fairness Measurement

Deborah Hellman's article addresses a fundamental conceptual question: what does it mean to measure **algorithmic fairness** (算法公平性)? The technological literature has produced multiple competing fairness metrics, but there has been insufficient philosophical attention to what these metrics actually measure and why they matter morally.

### Two Families of Fairness Metrics

Hellman identifies two dominant families of fairness metrics:

1. **Accuracy-based measures** (准确性度量): These require that algorithmic scores be equally accurate across protected groups. For example, a risk score should have the same **predictive value** (预测值)---the same probability that a person with a given score will actually engage in the predicted behaviour---regardless of group membership.

2. **Error-rate-based measures** (错误率度量): These require equality in the rates of specific types of errors across groups. The two most important error-rate metrics are **false positive rate parity** (假阳性率均等)---the same proportion of each group should be incorrectly classified as positive---and **false negative rate parity** (假阴性率均等)---the same proportion of each group should be incorrectly classified as negative.

### Hellman's Expressive and Dignitary Account

Hellman's most significant philosophical contribution is her analysis of when discrimination is *wrong*, which she develops in contrast to purely statistical or outcome-based accounts. Drawing on her broader work in anti-discrimination theory, she argues that discrimination is wrong when it **demeans** or **degrades** the person discriminated against---when it treats them as if they were of lesser moral worth or as if their individual characteristics do not matter.

On this **dignitary account** (尊严性解释), the wrongness of discrimination does not depend solely on its effects. An action can demean even if it produces no material harm, and an action can avoid demeaning even if it produces statistical disparities. Applied to algorithmic systems, the dignitary account suggests that the fundamental question is not whether the algorithm produces equal outcomes across groups but whether it treats individuals as bearers of dignity whose particular characteristics matter, rather than as interchangeable representatives of group statistics.

Hellman argues that calibration-based defences of algorithms that produce disparate error rates fail the dignitary test. Even if a calibrated model is epistemically accurate in the sense that scores mean the same thing for all groups, the fact that one group bears a disproportionate burden of false positives means that individual members of that group are being incorrectly and harmfully classified at higher rates. The dignitary harm lies in this systematic misclassification, not merely in the aggregate statistical pattern.

### Three Contributions

Hellman makes three distinct contributions:

**Conceptual**: She argues that accuracy-based measures relate to what one *ought to believe* about a scored individual---they are essentially epistemic norms. But fairness is typically a property of actions, not beliefs. A risk score might accurately reflect the statistical probability that a person will reoffend, but the question of fairness concerns what we *do* with that score, not whether it is epistemically justified. Therefore, accuracy-based measures are ill-suited as measures of fairness in the morally relevant sense.

**Normative**: Error-rate-based measures, by contrast, are directly connected to the actions taken on the basis of algorithmic scores. If a risk assessment tool produces more false positives for Black defendants---that is, if it more often incorrectly classifies Black people as high-risk---then Black people bear a disproportionate burden of unjust detention. Error-rate parity is therefore a normatively significant measure, though Hellman is careful to note that lack of parity is not constitutive of unfairness but rather provides important evidence that unfairness may exist.

**Legal**: A common assumption among algorithm designers is that anti-discrimination law categorically prohibits any use of race or other protected characteristics. Hellman argues that this assumption is too strong: the law is more nuanced than many technologists believe, and in some contexts, race-conscious design may actually be legally permissible and ethically required.

## Pessach and Shmueli: A Taxonomy of Algorithmic Fairness

Dana Pessach and Erez Shmueli provide a comprehensive survey of the algorithmic fairness landscape, organizing the field around a systematic taxonomy of causes, definitions, and interventions.

### Sources of Algorithmic Unfairness

Pessach and Shmueli identify several sources of algorithmic bias:

- **Historical bias**: The data reflects patterns of past discrimination, so models trained on this data reproduce those patterns.
- **Representation bias**: The training data fails to adequately represent certain populations, leading to worse performance for underrepresented groups.
- **Measurement bias**: The features used as proxies for the construct of interest may systematically distort the construct in ways that differ across groups.
- **Aggregation bias**: A one-size-fits-all model may fail to capture group-specific patterns, performing well on average but poorly for specific subgroups.

### Fairness-Enhancing Mechanisms

Pessach and Shmueli classify interventions into three categories:

1. **Pre-processing** (预处理): Modify the training data to remove or reduce bias before the model is trained. Techniques include reweighting, resampling, and data transformation.
2. **In-processing** (处理中): Modify the learning algorithm itself to incorporate fairness constraints during training. This includes constrained optimization and adversarial debiasing.
3. **Post-processing** (后处理): Modify the model's outputs after prediction to satisfy fairness criteria. This includes threshold adjustment and calibration.

<div class="remark">
<strong>Remark:</strong> The impossibility theorem reveals that algorithmic fairness is not a purely technical problem: it requires normative choices about which dimensions of fairness matter most in a given context. This is why philosophical analysis is indispensable to the fairness-in-AI enterprise. Technical tools can implement fairness once it is defined, but they cannot define it.
</div>


# Chapter 5: Structural Oppression and AI

## Frye: Sexism as Structural Oppression

Marilyn Frye's essay "Sexism" provides a foundational framework for understanding **structural oppression** (结构性压迫) that has profound implications for the analysis of algorithmic discrimination. Frye argues that sexism is not primarily a matter of individual prejudice or personal attitudes but an institutional phenomenon embedded in social structures.

### The Birdcage Metaphor

Frye's most celebrated contribution is the **birdcage metaphor** (鸟笼比喻) for oppression. If you examine a single wire of a birdcage, you cannot understand why the bird does not simply fly around it. Each individual barrier to women's advancement, taken in isolation, seems minor or easily circumvented. It is only when you step back and see the entire cage---the network of wires working together---that you understand how confinement operates. Oppression, on Frye's analysis, is a system of interlocking barriers that collectively restrict the movement and possibilities of members of subordinated groups.

<div class="definition">
<strong>Structural Oppression (结构性压迫):</strong> A network of systematically related forces and barriers---institutional, cultural, economic, and legal---that collectively confine members of a subordinated social group, restricting their options and penalizing them regardless of which direction they move. Structural oppression is distinct from individual acts of prejudice: it is a property of social systems, not of individual intentions.
</div>

### The Double Bind

Frye introduces the concept of the **double bind** (双重困境): oppressive systems create situations where every available option for the oppressed leads to negative consequences. A woman who is assertive is penalized for being "aggressive"; a woman who is deferential is penalized for lacking leadership qualities. The system is structured so that no available choice leads to a good outcome, creating the illusion of choice while ensuring continued subordination.

### Young's Five Faces of Oppression

Political philosopher Iris Marion Young develops Frye's structural analysis in her influential book *Justice and the Politics of Difference* (1990), identifying five distinct "faces" of oppression that together constitute the full phenomenology of structural subordination. Each face has a distinctive algorithmic expression.

**Exploitation** (剥削) refers to the transfer of the results of labour from one social group to another. In algorithmic systems, exploitation manifests when the data produced by users' activities---data generated through their labour and creativity---is appropriated by platform companies to train models that are then used to extract further value from those same users, often without compensation or meaningful consent.

**Marginalization** (边缘化) refers to the expulsion of a category of people from participation in social life. Algorithmic marginalization occurs when systems perform poorly for underrepresented groups (e.g., facial recognition failing on dark-skinned faces), when recommendation algorithms steer marginalized groups away from economic opportunities, or when automated systems simply fail to serve communities that lack the digital infrastructure or data density to be legible to the model.

**Powerlessness** (无权力) refers to the lack of authority, status, and sense of self that characterizes the lives of those who are neither exploited nor marginalizers but simply have no power. Algorithmic powerlessness arises from the opacity and inscrutability of algorithmic systems: people subject to consequential algorithmic decisions often have no ability to understand, contest, or appeal those decisions.

**Cultural imperialism** (文化帝国主义) refers to the universalization of a dominant group's experience and culture, rendering the perspectives of other groups invisible or deviant. Algorithmic cultural imperialism occurs when AI systems encode the values, aesthetics, and epistemologies of dominant groups as universal standards, treating everything else as noise or error. Natural language processing systems trained primarily on English-language text fail on other languages and dialects. Image recognition systems trained on Western datasets misclassify culturally specific objects.

**Violence** (暴力) refers to systematic and unprovoked attacks on persons or their property motivated by hatred of the social group they belong to. The algorithmic dimension of violence includes predictive policing systems that direct law enforcement violence toward specific communities, facial recognition systems that contribute to wrongful arrests and the violence of incarceration, and content moderation algorithms that systematically fail to remove violent content targeting marginalized groups while over-removing content from those same groups.

## Pessach and Shmueli: Detecting Structural Discrimination

Dana Pessach and Erez Shmueli's framework goes beyond cataloguing sources of bias to offer a methodology for detecting structural discrimination in algorithmic systems. Their approach recognizes that structural discrimination---discrimination that results from the embedding of algorithms within discriminatory social structures---is fundamentally different from the forms of bias that standard fairness metrics detect.

Standard fairness metrics compare outcomes for groups defined by protected characteristics: do Black and white defendants receive different scores? But structural discrimination may operate across multiple characteristics simultaneously, in ways that are invisible if you examine each characteristic separately. A hiring algorithm that disadvantages applicants from low-income neighbourhoods who attended community colleges and have employment gaps---a combination of characteristics that correlates strongly with race and gender---may not show a statistically significant disparity on any single dimension while producing substantial combined disadvantage.

Pessach and Shmueli propose **intersectional fairness analysis** (交叉性公平分析): examining outcomes for individuals defined by the intersection of multiple protected characteristics, not just by single characteristics in isolation. This approach, which draws on Kimberlé Crenshaw's foundational concept of **intersectionality** (交叉性) in legal theory, is better suited to detect the complex, multi-dimensional character of structural discrimination.

They also emphasize the importance of **counterfactual fairness** (反事实公平性): an individual should not be treated differently by an algorithm if, in a counterfactual world where their protected characteristics were different, the outcome would be different. Counterfactual fairness is a formal tool for operationalizing the principle that protected characteristics should not influence decisions, but implementing it requires a causal model of the data-generating process---a model that must make controversial assumptions about the structure of social causation.

## Mills: White Supremacy as a Political System

Charles W. Mills extends the structural analysis to race, arguing that **white supremacy** (白人至上主义) should be understood not as an extremist ideology held by a fringe minority but as the dominant **sociopolitical system** (社会政治制度) that has shaped the modern world. This conceptual move has significant consequences for how we understand algorithmic discrimination.

### The Racial Contract

Mills's analysis draws on his influential concept of the **Racial Contract** (种族契约), developed in his 1997 book of the same name. Traditional social contract theory posits that political society is founded on an agreement among free and equal persons. Mills argues that the actual historical "contract" was a *racial* contract: an agreement among white people to establish and maintain a system of racial domination. The social contract applies to those classified as white; those classified as non-white are subjects of the contract, not parties to it.

<div class="remark">
<strong>Remark:</strong> Mills's analysis challenges the assumption, common in mainstream political philosophy, that racial injustice is an aberration from an otherwise just system. On his account, racial injustice is foundational to the system itself. This has profound implications for algorithmic fairness: if the entire social structure is built on racial domination, then data drawn from that structure will inevitably encode racial hierarchy, and algorithms trained on that data will reproduce it. The problem is not a bug in the system but a feature of it.
</div>

### White Supremacy as Structure

Mills emphasizes that white supremacy as a sociopolitical system operates through institutions, practices, and norms rather than through individual attitudes. It manifests in wealth disparities, residential segregation, differential access to education and healthcare, and criminal justice disparities---precisely the domains in which algorithmic decision-making is increasingly deployed. Algorithms that draw on data from these domains do not merely reflect individual prejudices; they encode the cumulative effects of centuries of structural racial domination.

## Vowel: Indigenous Perspectives on Systemic Injustice

Chelsea Vowel's *Indigenous Writes* extends the analysis of structural oppression to the specific context of **Indigenous peoples** (原住民) in Canada, addressing histories and ongoing realities that are often invisible in mainstream discussions of algorithmic fairness.

### Colonial Structures

Vowel argues that the relationship between the Canadian state and Indigenous peoples must be understood through the lens of **colonialism** (殖民主义): the expropriation of Indigenous lands, the destruction of Indigenous governance systems, and the systematic assault on Indigenous cultures through policies such as residential schools and the Sixties Scoop. These are not historical events confined to the past but ongoing structures that continue to shape Indigenous life.

### Relevance to Algorithmic Systems

Vowel's analysis highlights a dimension of algorithmic fairness that is often overlooked: algorithmic systems designed and deployed within settler-colonial states inevitably operate within and reproduce colonial power structures. Data about Indigenous peoples is shaped by colonial categories and colonial priorities. Health data reflects the health effects of colonialism; criminal justice data reflects the overcriminalization of Indigenous peoples; economic data reflects the ongoing dispossession of Indigenous communities. Algorithmic systems that use this data without critical attention to its colonial provenance will perpetuate colonial injustice.

<div class="example">
<strong>Example --- The Indian Act and Data Categories:</strong> The Canadian Indian Act (1876, repeatedly amended) established legal categories for Indigenous peoples that reflected colonial priorities rather than Indigenous self-understandings. The distinction between "Status" and "non-Status" Indians, for instance, has no basis in Indigenous governance traditions but has profound consequences for access to services and rights. Algorithmic systems that use administrative categories derived from the Indian Act reproduce colonial classifications and their associated injustices.
</div>

### Five Themes

Vowel organizes her analysis around five categories: Terminology of Relationships, Culture and Identity, Myth-Busting, State Violence, and Land, Learning, Law, and Treaties. Each challenges prevailing assumptions held by non-Indigenous Canadians and underscores the need for any justice-oriented analysis---including analysis of AI systems---to take seriously the perspectives and experiences of Indigenous peoples, rather than treating mainstream frameworks as universal.


# Chapter 6: Ideal Theory and Racial Justice

## Shelby: A Rawlsian Approach to Racial Justice

Tommie Shelby argues that the philosophical framework developed by John Rawls can be productively deployed to address questions of **racial justice** (种族正义). This argument is significant because Rawls himself wrote very little about race, leading many theorists to conclude that his framework is inadequate or irrelevant to racial injustice.

### Rawls's Framework

Rawls's **theory of justice as fairness** (作为公平的正义) holds that just institutions are those that would be chosen by rational agents behind a **veil of ignorance** (无知之幕)---that is, without knowledge of their own social position, natural talents, or conception of the good. The two principles that emerge from this thought experiment are:

1. **Equal basic liberties** (平等基本自由): Each person has an equal right to the most extensive scheme of basic liberties compatible with a similar scheme for all.
2. **The difference principle** (差异原则): Social and economic inequalities are permitted only if they benefit the least advantaged members of society, subject to **fair equality of opportunity** (公平的机会平等, FEO).

### Shelby's Extension and Ideal Theory as Goal-Setting

Shelby argues that Rawls's **fair equality of opportunity** principle can be extended to address racial inequality without fundamentally altering the Rawlsian framework. On this view, racial discrimination violates FEO because it distributes social positions on the basis of morally arbitrary characteristics rather than talent and effort. A Rawlsian approach would therefore condemn racial discrimination as a violation of basic justice and would support robust institutional interventions to ensure that race does not determine life prospects.

Crucially, Shelby offers a partial defence of ideal theory not as a description of the actual world but as a **regulative ideal** (调节性理想)---a goal that guides action even when it cannot be fully achieved. On this reading, developing principles for a fully just society is not a distraction from addressing current injustice but a precondition for it: without a vision of the just society we are trying to build, we cannot identify what counts as progress or set an appropriate direction for reform.

Shelby draws a distinction between **racial injustice** (种族不正义) as discrimination and **racist injustice** (种族主义不正义) as oppression, arguing that Rawls's framework can accommodate both: discrimination violates FEO, while oppression violates the basic structure's commitment to treating all persons as free and equal.

<div class="definition">
<strong>Ideal Theory (理想理论):</strong> A mode of political theorizing that develops principles of justice for a perfectly just society---one characterized by full compliance with just institutions and favourable social conditions. Ideal theory asks: what would a fully just society look like? <strong>Non-ideal theory</strong> (非理想理论), by contrast, addresses questions of justice under conditions of partial compliance, historical injustice, and non-ideal circumstances.
</div>

## Mills: Against Ideal Theory and White Ignorance

Charles Mills launches a sustained critique of Shelby's approach, arguing that the Rawlsian framework cannot be successfully deployed for racial justice without radical revision. Mills's critique operates on multiple levels.

### The Ideal Theory Problem

Mills's most fundamental objection concerns the distinction between **ideal theory** and **non-ideal theory**. Rawls developed his principles for an idealized, perfectly just society. But racial injustice is a product of profoundly non-ideal conditions: centuries of slavery, colonialism, and systemic discrimination. Mills argues that ideal theory "obscures the realities of white supremacy and leads people to ignore or misperceive racial injustice." The idealizing assumptions strip away the very features of the social world---racial hierarchy, accumulated disadvantage, epistemic distortion---that any theory of racial justice must address.

### White Ignorance as Epistemic Concept

In work that extends beyond the Shelby debate, Mills develops the concept of **white ignorance** (白人无知) as a structural feature of societies organized around racial domination. White ignorance is not merely the absence of information; it is a socially produced and maintained system of not-knowing that enables the reproduction of racial hierarchy. White people in racially unjust societies are systematically wrong about the history of racial injustice, the mechanisms by which it operates, and their own complicity in it---not through individual cognitive failure but through structural features of how knowledge is produced and distributed.

White ignorance has direct implications for AI: the designers, funders, and deployers of algorithmic systems are overwhelmingly white, and the decisions they make---about what to optimize, whose harms to prioritize, what counts as a problem worth solving---are shaped by structural white ignorance. The gaps in AI ethics that Birhane et al. document (see Chapter 9) are, on Mills's analysis, predictable products of white ignorance.

### The Priority of Rectificatory Justice

Mills emphasizes that racial justice requires **rectificatory justice** (矫正正义)---corrective measures to address historical wrongs---not merely forward-looking principles for distributing opportunities. The pressing question is not "what principles should govern a perfectly just society?" but "what do we owe to those whose ancestors were enslaved, dispossessed, and systematically exploited?" Rawls's framework, designed for ideal conditions, has no obvious place for such backward-looking considerations.

### The Ideology of Ideal Theory

Most provocatively, Mills argues that ideal theory is not merely inadequate but actively harmful: it functions as an **ideology** (意识形态) that serves to maintain white supremacy by diverting philosophical attention away from the real structures of racial domination. By focusing on what a perfectly just society would look like, ideal theory renders invisible the mechanisms of racial injustice that actually exist.

<div class="remark">
<strong>Remark:</strong> The Shelby-Mills debate has direct implications for algorithmic fairness. Approaches that define fairness in ideal-theoretic terms---for example, by asking what outcomes a fair algorithm would produce in a just society---risk the same idealization problem that Mills identifies. If algorithms are deployed in a profoundly unjust society, defining fairness by reference to ideal conditions may produce interventions that are inadequate or even counterproductive.
</div>

## Frye: Anti-Subordination vs. Anti-Classification

Marilyn Frye's analysis of sexism as structural oppression connects to a foundational debate in constitutional law and political philosophy between two competing anti-discrimination principles: **anti-classification** (反分类) and **anti-subordination** (反从属化).

The **anti-classification principle** holds that the law should be colour-blind and sex-blind: decision-makers should not classify people by race or sex, period. On this view, any use of race in decision-making---whether to disadvantage or advantage members of a racial group---is presumptively unconstitutional. This principle is associated with formal equality: treat like cases alike, and the relevant question is whether race was used, not what effect that use had.

The **anti-subordination principle** holds that the fundamental wrong of racial and sex discrimination is the social and institutional subordination of certain groups. On this view, what matters is not whether race was used but whether the practice reinforces or perpetuates the subordination of a historically oppressed group. Race-conscious policies designed to remedy subordination (affirmative action) are permissible or even required; race-neutral policies that perpetuate subordination are prohibited.

Frye's structural analysis of sexism supports the anti-subordination principle: if oppression is systemic rather than a matter of individual decisions, then eliminating classification without eliminating subordination accomplishes nothing. An algorithm that never explicitly uses race but reproduces racial subordination through proxy variables satisfies the anti-classification principle while violating the anti-subordination principle.

## Toward a Non-Ideal Theory of Algorithmic Fairness

Fazelpour and Lipton's work (discussed in Chapter 7) represents one attempt to develop what a non-ideal approach to algorithmic fairness would look like. But the Mills-Shelby debate suggests that any genuinely non-ideal theory of algorithmic fairness must incorporate several elements that mainstream approaches lack:

1. **Historical accountability**: The algorithm must be evaluated in light of the history of discrimination that shaped the data it uses. An algorithm that perpetuates the effects of redlining is not merely producing disparate impact; it is reproducing a specific historical injustice.

2. **Structural causation**: The theory must attend to the structural causes of the disparities the algorithm reflects, not merely to the statistical patterns. Two algorithms might produce identical statistical disparities for different structural reasons, and the appropriate remedies would differ accordingly.

3. **Rectificatory dimension**: In some contexts, a genuinely fair algorithm may need to be explicitly rectificatory---designed to counteract the effects of historical discrimination---rather than merely neutral. This connects directly to the debate about algorithmic affirmative action in Chapter 7.

4. **Epistemic humility**: Non-ideal theory requires acknowledgment of what we do not know, including what we do not know because of structural white ignorance. Algorithmic systems built without adequate consultation with affected communities will reflect the ignorance of their designers.


# Chapter 7: Algorithmic Affirmative Action

## The Legal Landscape for Affirmative Action

Any discussion of algorithmic affirmative action must begin with the legal context established by decades of Supreme Court jurisprudence. American affirmative action law has evolved through a series of landmark decisions that define the conditions under which race-conscious policies are constitutionally permissible.

*Regents of the University of California v. Bakke* (1978) produced no majority opinion but established that race could be considered as one factor among many in university admissions (Justice Powell's opinion), while rigid racial quotas were impermissible. *Grutter v. Bollinger* (2003) upheld the University of Michigan Law School's holistic admissions process, which used race as one factor in the interest of achieving a diverse student body. The majority opinion by Justice O'Connor endorsed the "diversity rationale"---the educational benefits of a racially diverse student body---as a compelling state interest sufficient to justify race-conscious admissions.

*Students for Fair Admissions v. Harvard and UNC* (2023) effectively overruled *Grutter*, holding that race-conscious admissions programs at Harvard and the University of North Carolina violated the Equal Protection Clause. The Court's opinion by Chief Justice Roberts held that universities' admissions programs lacked sufficiently measurable objectives, involved racial stereotyping, and had no logical end point. The decision applies to public universities under the Fourteenth Amendment and to private universities under Title VI of the Civil Rights Act.

<div class="remark">
<strong>Remark:</strong> The SFFA decision does not directly govern employment or criminal justice contexts, and its implications for algorithmic systems are still being worked out. But it significantly restricts the range of race-conscious policies legally available in higher education and may signal broader judicial scepticism about race-conscious decision-making in other domains.
</div>

## The Philosophical Debate: Diversity Rationale vs. Remedial Rationale

Philosophers have long debated two distinct justifications for affirmative action, which correspond loosely to the legal landscape.

The **diversity rationale** (多样性论证) holds that affirmative action is justified because racial diversity produces educational or social benefits: diverse groups make better decisions, expose students to different perspectives, and prepare graduates for participation in a diverse society. On this view, the beneficiary of affirmative action is not the historically disadvantaged individual but the institution and society as a whole. Diversity is an instrument for achieving better collective outcomes.

The **remedial rationale** (补救性论证) holds that affirmative action is justified as a remedy for past discrimination: those who have been systematically disadvantaged by historical injustice are owed compensatory measures as a matter of rectificatory justice. On this view, the beneficiary is the individual who was wronged (or whose group was wronged), and affirmative action is a form of repair.

These two rationales have different implications for the design of affirmative action policies. The diversity rationale supports race-conscious policies only when and insofar as they produce measurable diversity benefits; it has no implications for contexts where diversity benefits are not demonstrable. The remedial rationale supports race-conscious policies in all contexts where historical discrimination has produced ongoing disadvantage, regardless of whether diversity benefits accrue.

## Translating Affirmative Action to Algorithmic Contexts

Affirmative action arguments do not translate straightforwardly to algorithmic contexts, and understanding why illuminates both the philosophical debate and the distinctive character of algorithmic decision-making.

Classical affirmative action involves human decision-makers who consciously take race into account when selecting among candidates. The philosophical debate concerns whether this race-consciousness is permissible or required. In algorithmic contexts, the question is more complex: should an algorithm's training procedure, objective function, or post-processing step explicitly account for race in order to produce more equitable outcomes?

Chander's "viral discrimination" framework (discussed in Chapter 7's original content) provides one answer: because historical discrimination has infected training data, race-conscious algorithmic design is necessary to break the cycle of discrimination. But this argument requires careful specification of *how* race-consciousness should be implemented and *what* it should be designed to achieve.

## Huq: When Is It Permissible to Use Race in an Algorithm?

Aziz Huq's analysis of racial equity in algorithmic criminal justice provides the most sustained philosophical treatment of the question. Huq argues that the legal standard developed for traditional affirmative action---strict scrutiny, requiring a compelling interest and narrowly tailored means---is poorly suited to evaluate algorithmic uses of race, for several reasons.

First, algorithmic race-consciousness is not analogous to human race-consciousness. An algorithm that uses race as an input feature to equalize error rates across groups is not "treating people differently because of their race" in the same sense as a human decision-maker who consciously prefers or disfavours racial group members. The algorithm is using race as a technical instrument to correct for structural patterns, not as a basis for moral judgment about individuals.

Second, the goal of algorithmic race-consciousness is typically not to benefit any individual because of their race but to ensure that algorithmic systems do not impose disproportionate burdens on members of historically disadvantaged groups. This goal is better understood as harm prevention than as preferential treatment.

Third, the alternative---algorithmic race-blindness---does not produce race-neutral outcomes when the training data reflects racial disparities. Race-blind algorithms in a race-structured world will reproduce racial stratification. The choice is not between race-consciousness and neutrality but between explicit race-consciousness (designed to counteract structural disadvantage) and implicit race-consciousness (encoded in proxies that correlate with race).

<div class="definition">
<strong>Algorithmic Affirmative Action (算法平权行动):</strong> The deliberate use of race (or other protected characteristics) in the design, training, or post-processing of algorithms in order to counteract the discriminatory effects of historical bias in training data and to produce more equitable outcomes across racial groups. Huq argues this may be permissible when the goal is harm prevention rather than preferential treatment.
</div>

## The Classification vs. Subordination Distinction Applied

The anti-classification / anti-subordination distinction (introduced in Chapter 6) is directly applicable to the algorithmic affirmative action debate.

Under the **anti-classification** view, using race in an algorithm is presumptively impermissible because it classifies people by race, regardless of whether the purpose is to advantage or disadvantage members of a group. This view corresponds to a colour-blind algorithmic ideal: the best algorithm is one that does not use race or its proxies.

Under the **anti-subordination** view, the question is not whether race is used but whether the algorithm reinforces or undermines racial subordination. An algorithm that uses race to equalize false positive rates across groups---reducing the burden of unjust detention on Black defendants---does not reinforce racial subordination; it combats it. An algorithm that ignores race but reproduces the patterns of racial subordination encoded in its training data does reinforce subordination, even if it never explicitly classifies by race.

Huq's analysis supports the anti-subordination view: the permissibility of using race in an algorithm should be evaluated by its effect on racial stratification over time, not merely by whether race appears in the model.

## The Meritocracy Objection and Responses

A common objection to algorithmic affirmative action---as to affirmative action generally---is the **meritocracy objection** (精英主义反对): preferences that select less qualified candidates over more qualified ones violate the principle that positions should be allocated on the basis of merit, and undermining meritocracy harms both the individuals passed over and the efficiency of institutions.

Several responses to the meritocracy objection are available in the algorithmic context:

**The credential critique**: The objection assumes that existing metrics of "merit" are genuine measures of relevant qualifications. But as O'Neil and Ajunwa document, the credentials and test scores used to define merit are themselves shaped by structural inequality. An applicant whose test scores are lower because she attended an underfunded school that was underfunded because of redlining is not less meritorious; she is less advantaged. Algorithms that use such credentials as measures of merit are not selecting for genuine merit but for the cumulative effects of structural privilege.

**The predictive accuracy critique**: Algorithms optimized for predictive accuracy on historically biased data are not selecting the most capable candidates; they are selecting the candidates most similar to those who have succeeded under conditions of historical discrimination. In a counterfactual world without historical discrimination, different candidates might have succeeded.

**The systemic efficiency argument**: Even on purely efficiency grounds, algorithmic affirmative action may be justified. If discrimination has prevented talented members of disadvantaged groups from developing their full potential, then correcting for that discrimination will improve the quality of selections, not diminish it. Algorithmic affirmative action may produce better outcomes than biased meritocracy.

## Fazelpour and Lipton: Algorithmic Fairness from a Non-Ideal Perspective

Sina Fazelpour and Zachary Lipton explicitly connect the algorithmic fairness literature to the philosophical debate between ideal and non-ideal theory, arguing that the shortcomings of current fair machine learning approaches reflect broader problems with ideal-theoretic reasoning.

### The Connection to Political Philosophy

Fazelpour and Lipton observe that mainstream fair machine learning proceeds by defining mathematical fairness criteria and then optimizing algorithms to satisfy them. This approach, they argue, is structurally analogous to **ideal theory** in political philosophy: it specifies what a fair outcome would look like and then attempts to close the gap between actual outcomes and the ideal. But this approach fails for the same reasons that ideal theory fails in the racial justice context: it ignores the mechanisms by which injustice arose, the responsibilities of various decision-makers, and the potential unintended consequences of proposed interventions.

### Misguided Interventions

The authors demonstrate that naive applications of fairness constraints can lead to perverse outcomes. For example, enforcing **demographic parity** in a hiring algorithm might lead to the selection of less qualified candidates from underrepresented groups, which could reinforce stereotypes and ultimately harm the very groups the intervention was designed to help. A non-ideal approach would attend to these downstream effects and to the broader social context in which the algorithm operates.

<div class="definition">
<strong>Non-Ideal Approach to Algorithmic Fairness (算法公平的非理想方法):</strong> An approach that begins from the actual conditions of injustice rather than from an idealized model, that attends to the historical and structural causes of unfairness, and that evaluates interventions by their likely consequences in the real (non-ideal) world rather than by their conformity to abstract fairness criteria.
</div>

### Reinterpreting Impossibility Results

Fazelpour and Lipton offer a novel interpretation of the impossibility results in algorithmic fairness. On the standard reading, the impossibility theorem shows that we cannot have everything we want: some fairness criteria must be sacrificed. On Fazelpour and Lipton's reading, the impossibility results reflect the fact that different fairness metrics are appropriate in different contexts, and the choice among them should be guided by attention to the specific mechanisms of injustice at work in each domain, not by abstract theoretical considerations.

## Chander: The Case for Algorithmic Affirmative Action

Anupam Chander's article, written as a review of Frank Pasquale's *The Black Box Society*, advances a bold thesis: if the world on which algorithms are trained is pervasively discriminatory, then the appropriate remedy is **algorithmic affirmative action** (算法平权行动).

### Viral Discrimination

Chander introduces the concept of **viral discrimination** (病毒性歧视): algorithms trained on a world pervaded by discriminatory effects are likely to reproduce that discrimination, much as a virus replicates itself through a host. If historical data reflects the effects of racial discrimination---for example, if Black applicants have historically been denied loans at higher rates---then an algorithm trained on that data will learn to deny loans to Black applicants, reproducing and perpetuating the original discrimination.

### The Argument for Affirmative Action

Chander argues that merely requiring algorithms to be "race-neutral" is insufficient. Race-neutral algorithms operating on race-permeated data will produce racially discriminatory outcomes. The only way to break the cycle of viral discrimination is to adopt affirmative measures: to explicitly design algorithms that counteract the discriminatory patterns embedded in historical data.

<div class="remark">
<strong>Remark:</strong> Chander's argument parallels the debate about affirmative action in employment and education. Just as proponents of affirmative action argue that formally equal treatment in a substantively unequal society perpetuates inequality, Chander argues that algorithmically "neutral" treatment in a discriminatory data environment perpetuates algorithmic discrimination. The remedy in both cases is conscious, intentional efforts to counteract structural disadvantage.
</div>

### The Irony of Neutrality

Chander observes an irony: law has historically turned to algorithms precisely in order to *reduce* the discriminatory effects of human discretion. Sentencing guidelines, for example, were adopted to reduce disparities in sentences imposed by individual judges. But algorithms that learn from the sentencing patterns of those same biased judges will replicate their biases at scale. The solution that was designed to reduce discrimination becomes a new vector for it.

<div class="example">
<strong>Example --- Sentencing Guidelines:</strong> Before algorithmic sentencing guidelines, judges had broad discretion in sentencing, and studies documented significant racial disparities in sentences for comparable offences. Sentencing guidelines were intended to constrain this discretion and reduce disparities. But when algorithmic risk assessment tools are introduced into the sentencing process, and those tools are trained on historical sentencing data, they may replicate the very disparities the guidelines were designed to eliminate.
</div>


# Chapter 8: Criminal Justice and Algorithmic Bias

## COMPAS: A Sustained Case Study

The **COMPAS** (Correctional Offender Management Profiling for Alternative Sanctions) risk assessment tool is the most extensively analysed case in the algorithmic fairness literature, and it repays sustained examination because it illuminates nearly every theoretical issue raised in this course.

### How COMPAS Works

COMPAS was developed by Northpointe (now Equivant) as a commercial risk assessment tool for use at multiple stages of the criminal justice process---pretrial detention, sentencing, and parole. The instrument produces a risk score from 1 to 10 based on responses to a 137-question survey administered to defendants. The questionnaire covers topics including criminal history, peer relationships, residential stability, education and employment history, and attitudes toward criminal behaviour.

Crucially, COMPAS does not directly ask about race. Yet the inputs it uses---residential history, employment stability, educational attainment, family criminal history---all correlate with race in the United States because of structural inequalities produced by decades of discriminatory policy. The algorithm thus encodes racial information through proxies, exactly as Prince and Schwarcz's framework would predict.

### The ProPublica Analysis

In May 2016, ProPublica journalists Julia Angwin, Jeff Larson, Surya Mattu, and Lauren Kirchner published "Machine Bias," an analysis of COMPAS scores for approximately 7,214 defendants in Broward County, Florida. Their principal findings:

- Black defendants were nearly twice as likely as white defendants to be falsely flagged as future criminals (**false positive rate** of 44.9% for Black defendants vs. 23.5% for white defendants).
- White defendants were more likely than Black defendants to be incorrectly flagged as low risk despite going on to reoffend (**false negative rate** of 47.7% for white defendants vs. 28.0% for Black defendants).

ProPublica presented these findings as evidence that COMPAS is racially biased, producing systematically worse outcomes for Black defendants through a pattern of over-classifying them as high-risk and under-classifying white defendants as low-risk.

### Northpointe's Response

Northpointe responded that COMPAS is **calibrated**: among defendants receiving any given score, Black and white defendants reoffend at approximately the same rate. A score of 7 predicts the same probability of reoffending regardless of race. Northpointe argued that calibration is the appropriate standard for a risk prediction instrument: it means the instrument is measuring the same thing for all groups and is not systematically over- or under-predicting for any group.

### What the Disagreement Reveals

The ProPublica-Northpointe dispute is not a factual disagreement but a normative one. Both parties' empirical claims are correct. Because Black defendants in Broward County had higher observed recidivism rates (reflecting higher rates of policing and arrest, not necessarily higher rates of criminal behaviour), a calibrated instrument will necessarily produce higher scores for Black defendants on average, and this mathematical consequence produces the higher false positive rates ProPublica documented.

The Chouldechova impossibility theorem shows that both parties are defending different but mathematically coherent fairness criteria that cannot simultaneously be satisfied when base rates differ. The question of which criterion is appropriate is a philosophical question about what justice requires in the context of pretrial detention. Given that false positives lead to unjust incarceration---a severe deprivation of liberty---there is a strong argument that minimizing false positive rate disparities should take priority over calibration. But this is an argument from moral premises, not from mathematics.

## The Dressel and Farid Study

A further disturbing finding comes from Dressel and Farid's 2018 study published in *Science Advances*. They found that COMPAS's predictions for two-year recidivism were no more accurate than predictions made by untrained volunteers recruited through an online crowdsourcing platform and given only the defendant's age, sex, and prior criminal record. Both COMPAS and the human volunteers achieved approximately 65% accuracy.

This finding undermines a key claim made for risk assessment tools: that their superior predictive power justifies their use despite concerns about fairness. If humans can match algorithmic accuracy with just three variables, then the elaborate technical machinery of COMPAS---and the opacity it creates---provides no accuracy benefit. It adds complexity, legitimizes decisions through a veneer of scientific objectivity, and forecloses appeal, while delivering no measurable improvement in prediction.

<div class="definition">
<strong>Automation Bias in Criminal Justice:</strong> The tendency of judges and other criminal justice actors to defer to algorithmic risk scores even when those scores provide no more information than is available from simple heuristics. The algorithmic score functions as social proof---its quantitative precision creates an appearance of authority that is not supported by actual predictive superiority.
</div>

## Birhane's Relational Ethics Critique

Abeba Birhane brings a relational and Ubuntu-inspired ethical framework to bear on criminal justice AI that offers a fundamental challenge to the individualist premises of mainstream algorithmic fairness analysis.

The dominant frameworks in algorithmic fairness treat the individual as the basic unit of analysis. Fairness is assessed by comparing outcomes for individuals across groups: does individual *i* of race *A* receive the same score as a comparable individual *j* of race *B*? The goal is to ensure that similarly situated individuals are treated similarly. This is an essentially individualist framework.

**Ubuntu ethics** (乌班图伦理学), rooted in sub-Saharan African philosophical traditions, holds that persons are fundamentally relational beings: *umuntu ngumuntu ngabantu* (a person is a person through other persons). Identity, wellbeing, and moral status are constituted through relationships and community, not through the properties of isolated individuals. The Ubuntu framework shifts the unit of analysis from the individual to the relationship and the community.

Birhane argues that this relational perspective reveals dimensions of algorithmic harm that individualist frameworks miss. Criminal justice algorithms that are "fair" at the individual level---producing equal error rates across racial groups---may still damage communities by breaking social bonds, disrupting families, and destabilizing communities through mass incarceration. These community-level harms are invisible to individual-focused fairness metrics.

Furthermore, Birhane argues that the categories used in criminal justice algorithms---arrest records, residential stability, employment history---encode an individualist account of crime and punishment that misrepresents the structural and relational causes of behaviour. Treating recidivism as a property of individuals, to be predicted from individual attributes, ignores the relational and structural conditions that shape behaviour.

## Pretrial Detention and Bail Algorithms

One of the most consequential applications of algorithmic risk assessment is in **pretrial detention** (审前羁押): the decision whether to detain defendants before trial or release them pending trial, and on what conditions.

The bail system in the United States has been criticized for decades as producing racially and economically disparate outcomes. Defendants who cannot afford cash bail are detained even for minor offences; wealthier defendants with equal or greater flight risk are released. Algorithmic risk assessment tools were adopted partly as a reform measure---replacing cash bail with risk-based decisions about who poses a genuine flight or public safety risk.

But algorithmic bail tools inherit the racial disparities of the system they were meant to reform. Because historical bail and pretrial detention decisions were racially disparate, training data for bail algorithms reflects those disparities. The Arnold Foundation's Public Safety Assessment (PSA), used in jurisdictions across the United States, has been found to produce racially disparate results in multiple studies, classifying Black defendants as higher risk than white defendants with comparable criminal histories.

Moreover, the use of algorithms in bail decisions may produce **due process** (正当程序) concerns. Defendants have a constitutional right to a bail hearing before an impartial judicial officer. When that officer defers to an algorithmic risk score, the effective decision-maker is the algorithm---an opaque system whose methodology the defendant cannot examine or contest.

## Predictive Policing and Feedback Loops

**Predictive policing** (预测性警务) tools direct police resources to locations predicted to experience crime. ShotSpotter, PredPol (now Geolitica), and similar systems use historical crime and arrest data to identify "hot spots" where crime is predicted to be concentrated.

The feedback loop problem is acute in predictive policing. If the training data consists of arrest records (rather than actual crime, which is often unobserved), and if arrest patterns are shaped by prior policing decisions (which often reflected racial bias), then the predictive model will direct police to areas that are already heavily policed. More policing generates more arrests, which strengthens the model's predictions, which directs more policing. The result is a self-amplifying loop that concentrates police presence in communities of colour while reducing it in whiter, wealthier areas.

As Huq argues, evaluating predictive policing tools by their short-term accuracy is insufficient. An accurate tool that predicts arrests in over-policed areas is reinforcing a discriminatory policing pattern, not identifying genuine crime patterns. The appropriate evaluation requires attending to the long-term, dynamic effects of algorithmic policing on communities.

## Huq: Racial Equity in Algorithmic Criminal Justice

Aziz Huq provides a sustained analysis of algorithmic tools in the criminal justice system, examining their interaction with the enduring racial dimensions of American criminal justice. His analysis is distinctive in its focus on the *dynamic* effects of algorithmic systems and its critique of existing legal frameworks for evaluating them.

### Constitutional Inadequacy

Huq argues that existing **constitutional doctrine** (宪法原则) is poorly suited to evaluate the racial effects of algorithmic criminal justice. The Equal Protection Clause, as interpreted by the Supreme Court, requires proof of **discriminatory intent** (歧视意图)---deliberate purpose to discriminate on the basis of race. But algorithmic discrimination typically occurs without any discriminatory intent on the part of the algorithm's designers or users. The algorithm discriminates because it was trained on biased data, not because anyone intended it to discriminate. Constitutional doctrine, focused on intent, cannot capture this form of discrimination.

### A Dynamic Perspective

Huq's most original contribution is his proposal to evaluate algorithmic criminal justice tools in terms of their **long-term, dynamic effects on racial stratification** (长期动态种族分层效应). A risk assessment tool might satisfy technical fairness criteria at a given point in time while, over the long run, exacerbating racial disparities by reinforcing feedback loops between policing, incarceration, and community disadvantage.

<div class="example">
<strong>Example --- Predictive Policing Feedback Loops:</strong> A predictive policing algorithm trained on historical arrest data directs police to predominantly Black neighbourhoods. Increased police presence leads to more arrests in those neighbourhoods, generating more data that confirms the algorithm's predictions. Over time, the algorithm concentrates policing resources ever more heavily in Black communities, increasing incarceration rates and deepening racial stratification, even as the algorithm satisfies point-in-time fairness criteria. Huq argues that evaluating such systems requires attending to these dynamic effects, not merely to static fairness metrics.
</div>

### Toward Racial Equity

Huq argues that the appropriate standard for evaluating algorithmic criminal justice is not formal fairness but **racial equity** (种族平等): the algorithm should be evaluated by whether it reduces or increases racial stratification over time. This standard requires attention to context, history, and the cumulative effects of algorithmic decisions, not merely to the mathematical properties of the algorithm at a single point in time.

<div class="remark">
<strong>Remark:</strong> Huq's dynamic perspective connects to the broader debate about ideal versus non-ideal theory. A static fairness analysis evaluates algorithms against an ideal standard; a dynamic analysis evaluates them by their effects in a non-ideal world. The latter approach is more sensitive to the realities of structural racism but also more difficult to operationalize, since it requires predicting the long-term social effects of algorithmic interventions.
</div>


# Chapter 9: Black Feminist and Decolonial Perspectives on AI Ethics

## Birhane et al.: The Forgotten Margins of AI Ethics

Abeba Birhane and colleagues provide a critical empirical analysis of the AI ethics literature itself, asking whether the field practices what it preaches. Their study examines peer-reviewed papers from two premier AI ethics conferences---FAccT (Fairness, Accountability, and Transparency) and AIES (AI, Ethics, and Society)---and finds significant gaps between the field's stated commitments and its actual scholarly output.

### Three Approaches to AI Ethics

Birhane et al. categorize the AI ethics literature into three broad approaches:

1. **Western canonical philosophy**: Approaches grounded in traditional ethical theory---utilitarianism, deontology, virtue ethics---applied to AI contexts.
2. **Mathematical and statistical methods**: Approaches that formalize fairness as mathematical constraints and develop technical tools for satisfying them.
3. **Critical studies**: Approaches emerging from critical data studies, critical algorithm studies, and critical information studies that attend to power, history, and social structure.

### Empirical Findings

The authors' most striking finding is that despite the stated goals of the AI ethics community, the actual literature remains shallow in its engagement with the experiences and perspectives of **marginalized communities** (边缘化群体). Specifically:

- Many papers operate at a high level of abstraction, without grounding their analysis in concrete applications or the lived experiences of affected people.
- Papers that discuss harms to specific groups often fail to name those groups, treating "bias" and "unfairness" as generic problems rather than as phenomena that affect specific communities in specific ways.
- The field's dominant paradigms---Western canonical philosophy and mathematical methods---tend to marginalize the perspectives of those most affected by algorithmic harm.

### Structural Sensitivity

Birhane et al. call for an AI ethics that is sensitive to **structural and historical power asymmetries** (结构性和历史性权力不对称). This means grounding analysis in concrete use-cases and people's lived experiences; explicitly naming the groups that are harmed and threatened; and drawing on intellectual traditions---including critical race theory, Black feminism, postcolonial theory, and Indigenous knowledge systems---that centre the perspectives of the marginalized.

<div class="remark">
<strong>Remark:</strong> Birhane et al.'s critique of the AI ethics field mirrors Mills's critique of ideal theory in political philosophy: both argue that the dominant frameworks in their respective fields systematically obscure the realities of oppression by operating at a level of abstraction that renders invisible the specific experiences of those who are most affected. Just as Mills argues that ideal theory functions as ideology, Birhane et al. suggest that abstract, decontextualized AI ethics can function to legitimate algorithmic systems while providing little benefit to those they harm.
</div>

## Birhane's Relational Ubuntu Ethics

Birhane's philosophical framework draws explicitly on **Ubuntu ethics** (乌班图伦理学), an African communal ethical tradition whose central insight is expressed in the Nguni proverb *umuntu ngumuntu ngabantu*: a person is a person through other persons. This relational ontology stands in fundamental contrast to the Western liberal individualism that underlies mainstream algorithmic fairness.

Mainstream algorithmic fairness asks: is this individual being treated fairly compared to other individuals? Ubuntu ethics asks: is this community flourishing? Are the relationships that constitute persons being respected and strengthened? Are people being enabled to participate in the communal life through which they realize their humanity?

These are not merely different emphases within a shared framework; they reflect fundamentally different ontologies of what a person is. The individual of liberal political philosophy is a bearer of rights and interests who pre-exists social relations; the person of Ubuntu ethics is constituted *through* social relations and cannot be understood apart from them. Algorithmic systems that treat people as collections of individual attributes---historical records, demographic characteristics, survey responses---misrepresent the relational character of human beings and thereby systematically distort their assessments of individual situations.

Birhane applies this framework to criminal justice AI with particular force. A risk assessment that treats a defendant as a bundle of risk factors---criminal history, employment status, residential stability---without attending to the relational context of her life (the family circumstances that shaped her history, the community supports that might prevent reoffending, the relational damage that incarceration would cause) is producing a profoundly impoverished and distorted assessment. The Ubuntu perspective demands that algorithmic systems attend to the relational and communal dimensions of human life, not merely its individual attributes.

## Hampton: Black Feminist Musings on Algorithmic Oppression

Lelia Hampton brings **Black feminist theory** (黑人女性主义理论) to bear on algorithmic oppression, drawing on the tradition of feminist science and technology studies to argue that algorithmic systems cannot be understood apart from the structures of racial and gender oppression in which they are embedded.

### Historical Continuities

Hampton situates algorithmic oppression within a longer history of **scientific oppression** (科学压迫) against marginalized communities. From scientific racism and eugenics to contemporary algorithmic discrimination, she traces continuities in the use of ostensibly objective, scientific methods to justify and perpetuate the subordination of Black people, women, and other marginalized groups. Algorithms are not a new phenomenon but the latest iteration of a long tradition of using the authority of science to naturalize social hierarchy.

The history Hampton traces is not merely analogical; it is causal. The same institutions that developed and deployed scientific racism in the nineteenth and early twentieth centuries later developed the data-driven and actuarial methods that became the precursors of contemporary algorithmic risk assessment. The genealogy of the COMPAS-style instrument runs through the eugenicist Earnest Hooton's criminal anthropology, through the actuarial instruments developed by prediction researchers in the mid-twentieth century, through the risk assessment boom of the 1990s. Hampton's historical method reveals continuities that purely synchronic analyses of algorithmic fairness cannot see.

### Invisibility and Hypervisibility

Hampton examines the concepts of **invisibility** (隐形) and **hypervisibility** (超可见性) as they manifest in algorithmic systems. Marginalized people are simultaneously invisible---their needs, perspectives, and experiences are not represented in the data or considered in system design---and hypervisible---they are subjected to disproportionate surveillance, monitoring, and control. This **double bind** (双重困境) echoes Frye's analysis of structural oppression: the system is structured so that marginalized people cannot escape harm regardless of which direction they move.

<div class="example">
<strong>Example --- Facial Recognition:</strong> Facial recognition technology exemplifies the invisibility-hypervisibility dynamic. Studies have shown that these systems perform significantly worse on darker-skinned faces, particularly those of Black women---a form of technological invisibility. At the same time, facial recognition is disproportionately deployed in contexts of surveillance and policing that target Black communities---a form of technological hypervisibility. Black people are simultaneously not seen (their faces are not accurately recognized) and excessively seen (they are subjected to disproportionate surveillance).
</div>

### Critiquing Diversity as Solution

Hampton critically examines the common prescription that increasing **diversity** (多样性) in AI development teams will solve the problem of algorithmic bias. While diversity is valuable, Hampton argues that it is insufficient as a response to structural oppression. Adding more women and people of colour to development teams does not, by itself, change the structures of power within which those teams operate. Diversity without structural transformation risks becoming a form of tokenism that legitimates existing systems while failing to address the root causes of algorithmic oppression.

### Transparency Is Not Enough

Hampton further argues that **transparency** (透明度) in algorithmic systems, while important, is not a sufficient remedy for algorithmic oppression. An algorithm can be fully transparent---its code can be open-source, its training data publicly available, its decision process fully documented---and still be oppressive. Transparency reveals *how* an algorithm works but does not, by itself, change the structures of power that determine *what* it does and *to whom*. Abolishing algorithmic oppression requires not merely making oppressive systems visible but dismantling the structures of oppression in which they are embedded.

### Toward Abolition

Hampton concludes with a call that echoes abolitionist traditions in Black feminist thought: if we wish to live in a more just world, we must not only abolish algorithmic oppression but all oppression. Technical interventions within existing structures---fairness constraints, bias audits, diversity initiatives---may mitigate specific harms but cannot achieve justice so long as the underlying structures of racial and gender domination remain intact.

<div class="definition">
<strong>Algorithmic Oppression (算法压迫):</strong> The systematic use of algorithmic systems to reinforce, reproduce, and extend existing structures of social domination, particularly along the axes of race, gender, class, and coloniality. Algorithmic oppression is not a failure of technology but a function of the social structures within which technology operates.
</div>

## Vowel and Indigenous Data Sovereignty

Chelsea Vowel's analysis of Indigenous structural oppression connects to the emerging movement for **Indigenous data sovereignty** (原住民数据主权): the claim that Indigenous peoples have rights over the collection, ownership, and application of data about their communities.

The **CARE principles** for Indigenous data governance---Collective benefit, Authority to control, Responsibility, and Ethics---articulate a framework for Indigenous data sovereignty that stands in productive tension with the dominant frameworks of algorithmic fairness. Where mainstream fairness frameworks ask how data should be processed to produce equitable outcomes, Indigenous data sovereignty frameworks ask prior questions: who has the right to collect this data? For whose benefit? On whose terms? With what accountability to the communities whose lives the data represents?

These are questions that algorithmic fairness frameworks typically take for granted: they assume that data has already been collected and that the task is to process it fairly. But from an Indigenous data sovereignty perspective, the act of data collection itself is a political act, and algorithmic systems built on data collected without Indigenous consent or control reproduce colonial patterns of extraction and control even when they satisfy mainstream fairness criteria.

Vowel's analysis also highlights the importance of **data categories** (数据类别) as a site of political contestation. The categories used in algorithmic systems---race, ethnicity, nationality, tribal membership---are not neutral descriptors but political constructs that reflect particular histories of power. Administrative categories derived from the Indian Act, census categories that flatten the diversity of Indigenous nations, crime data that reflects the overcriminalization of Indigenous peoples: all of these encode colonial priorities into the data that algorithmic systems process.

## Synthesizing Conclusion: From Fairness to Justice

The perspectives assembled in this final chapter---Birhane's relational Ubuntu ethics, Hampton's Black feminist abolitionism, Vowel's Indigenous data sovereignty---converge on a challenge to the foundational assumptions of mainstream algorithmic fairness.

Mainstream algorithmic fairness assumes that the goal is to make existing decision-making systems work more equitably: the same processes (lending, hiring, criminal justice), the same objectives (profit maximization, recidivism prediction, creditworthiness assessment), but with fairer outcomes across demographic groups. The task is technical and incremental: identify bias, measure it, correct it.

The critical perspectives in this chapter reject this framing. They argue that the decision-making systems themselves---the processes, the objectives, the institutions within which they are embedded---are expressions of structures of domination. Making them more technically equitable, without transforming the structures they serve, is at best palliative and at worst a legitimating gesture that makes oppressive systems harder to contest by giving them a veneer of fairness.

Hampton's abolitionist conclusion is the most radical expression of this critique: the goal should not be fair algorithms within oppressive institutions but the transformation of those institutions. Birhane's relational ethics points toward a reconstruction of the goals of algorithmic systems---from individual risk prediction to community flourishing. Vowel's sovereignty framework demands that the communities most affected by algorithmic systems have genuine authority over them, not merely nominal inclusion.

<div class="remark">
<strong>Remark:</strong> The tension between the reformist and transformative positions is not merely academic. It has practical implications for how we evaluate proposed interventions. A reformist perspective will welcome bias audits, fairness constraints, and diversity initiatives as meaningful progress. A transformative perspective will evaluate these measures by whether they reduce the actual subordination of marginalized communities or merely make their subordination more technically sophisticated. Both perspectives have something to teach: the reformist perspective ensures that we make practical improvements in the near term; the transformative perspective ensures that we do not mistake near-term improvements for the achievement of justice.
</div>

Hampton's analysis represents a significant departure from the dominant frameworks in algorithmic fairness. Where mainstream approaches seek to make algorithms fairer within existing social structures, Hampton questions whether fairness within fundamentally unjust structures is meaningful. Her Black feminist perspective insists that the problem is not algorithms per se but the structures of oppression that algorithms encode and perpetuate. This represents a move from reformist to transformative or abolitionist approaches to AI ethics---a move that challenges the entire enterprise of "fair machine learning" as currently conceived.

The task this course has set is not to resolve this tension but to understand it clearly enough to reason about it carefully. The goal of fairness and anti-discrimination in AI is not a simple technical problem with a technical solution; it is a site where the deepest questions of political philosophy---about justice, oppression, identity, and the good society---are being worked out in code, data, and institutional practice.
