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

O'Neil introduces the term **Weapons of Math Destruction** (数学杀伤性武器, or WMDs) to designate algorithmic systems that share three dangerous characteristics: they are **opaque** (不透明的), meaning that the people affected by them cannot understand how decisions are made; they are **scalable** (可规模化的), meaning they can be applied to millions of people simultaneously, amplifying any embedded biases; and they are **unregulated** (无监管的), meaning there is no external check on their accuracy or fairness.

<div class="definition">
<strong>Weapon of Math Destruction (WMD):</strong> A mathematical model or algorithm that is opaque, scalable, and damaging, and that encodes prejudice, misunderstanding, or bias into software systems that increasingly manage human lives.
</div>

O'Neil argues that WMDs create **pernicious feedback loops** (恶性反馈循环). Consider a predictive policing algorithm trained on historical arrest data: if past policing concentrated on certain neighbourhoods (often due to racial profiling), the algorithm will direct future policing resources to those same areas, generating more arrests there, which in turn confirms the algorithm's predictions. The model does not detect crime; it detects policing patterns. The result is a self-reinforcing cycle that entrenches existing inequalities while wearing the mask of mathematical objectivity.

<div class="example">
<strong>Example --- Teacher Evaluation Models:</strong> O'Neil examines how value-added models used to evaluate public school teachers in the United States produced wildly inconsistent scores that could swing dramatically from year to year. A teacher rated excellent one year might be rated among the worst the next, not because her teaching changed, but because the model was poorly designed. Yet the scores had real consequences: teachers were fired on the basis of opaque models they could not contest. The model's opacity and scalability made it a WMD.
</div>

A recurring theme in O'Neil's analysis is that WMDs disproportionately harm the poor and members of marginalized racial groups. A lending algorithm that uses zip code as a predictive variable effectively encodes racial segregation, since zip codes in the United States correlate strongly with race. A student from a poor neighbourhood denied a loan because the model deems her "too risky" is cut off from the education that might lift her out of poverty, generating a vicious spiral of disadvantage.

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

## Kleinberg et al.: Algorithms as Tools for Transparency

Jon Kleinberg, Jens Ludwig, Sendhil Mullainathan, and Cass Sunstein advance a provocative thesis: contrary to widespread concern, the age of algorithms can actually make it *easier* to detect and prove discrimination. Their argument begins from the observation that human decision-making is notoriously opaque. When a hiring manager rejects a candidate, it is often impossible to determine whether the decision was motivated by legitimate considerations, unconscious bias, or deliberate prejudice. People may not be aware of their own biases, and even when they are, they can easily dissemble.

Algorithms, by contrast, require **explicitness** (明确性). An algorithm must be given a defined objective function, a specified set of input variables, and a transparent set of rules for combining them. This very specificity, Kleinberg et al. argue, creates new opportunities for scrutiny. One can examine which variables the algorithm uses, test whether protected characteristics or their proxies influence outputs, and compare outcomes across groups in ways that are simply impossible with human decision-makers.

<div class="definition">
<strong>Disparate Impact (差别影响):</strong> A legal doctrine under which a facially neutral practice can be deemed discriminatory if it disproportionately harms members of a protected class, regardless of whether discrimination was intended.
</div>

### The Transparency Argument

The authors identify several dimensions along which algorithms provide transparency unavailable in human decision-making:

1. **Input transparency**: We can know exactly which variables the algorithm considers and which it does not.
2. **Process transparency**: We can examine the rules or learned parameters that map inputs to outputs.
3. **Output transparency**: We can systematically compare outcomes across demographic groups and conduct counterfactual analyses.

This transparency makes it possible, in principle, to subject algorithmic decisions to rigorous anti-discrimination scrutiny. If an algorithm produces worse outcomes for one racial group, we can investigate precisely which inputs and which aspects of the model are responsible, and we can test counterfactual scenarios in which group membership is varied while other factors are held constant.

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

### The COMPAS Case

Johnson uses the COMPAS recidivism prediction algorithm as a primary case study. COMPAS, which stands for Correctional Offender Management Profiling for Alternative Sanctions, produces risk scores used by judges in bail and sentencing decisions. A 2016 ProPublica investigation found that COMPAS produced significantly higher false-positive rates for Black defendants: Black defendants who did not go on to reoffend were more likely to be classified as high-risk than similarly situated white defendants. This disparity, Johnson argues, illustrates the Proxy Problem in action: the algorithm's input features served as proxies for race, producing racially disparate outcomes despite the absence of race as an explicit input.

## Prince and Schwarcz: Proxy Discrimination as a Structural Phenomenon

Anya Prince and Daniel Schwarcz provide a legal analysis of **proxy discrimination** (代理歧视), arguing that AI and big data represent a qualitative shift in the risk of unintentional proxy discrimination. Their central insight is that proxy discrimination is a particularly pernicious subset of **disparate impact** (差别影响): it arises when a facially neutral practice disproportionately harms members of a protected class *and* the usefulness of that practice derives, at least in part, from the very correlation that produces the disparate impact.

### Why AI Intensifies the Problem

Prince and Schwarcz argue that AI systems are inherently structured to engage in proxy discrimination whenever they are deprived of information about protected characteristics. When an algorithm cannot use race directly, it will find other variables that correlate with race and use those instead---not out of any discriminatory intent, but because those correlations are genuinely predictive. The algorithm is simply doing what it is designed to do: finding the best available predictors of the target variable. If race is predictive (because of systemic discrimination), and direct use of race is prohibited, the algorithm will route around the prohibition by exploiting proxies.

<div class="remark">
<strong>Remark:</strong> This analysis reveals a deep irony: the legal prohibition on using protected characteristics in decision-making, which was designed to prevent discrimination, can actually exacerbate proxy discrimination in the algorithmic context. By forcing algorithms to use proxies instead of the characteristic itself, the prohibition makes discrimination harder to detect while doing nothing to eliminate it.
</div>

### Three Regulatory Strategies

Prince and Schwarcz evaluate three potential responses:

1. **Data collection and reporting**: Allow or require algorithms to collect data on protected characteristics for the purpose of monitoring and reporting outcomes to regulators. This approach does not use the data in decision-making but uses it to detect disparities.

2. **Ethical algorithms**: Use statistical techniques to identify and correct for correlations between facially neutral variables and protected characteristics, effectively "debiasing" the model.

3. **Permissive regulation**: Instead of prohibiting the use of protected characteristics and then struggling with proxies, allow all variables and instead directly regulate outcomes, prohibiting all forms of discrimination except those specifically authorized.

Each strategy involves significant tradeoffs between accuracy, fairness, privacy, and administrability. Prince and Schwarcz argue that simple solutions---such as banning obvious proxies---are likely to be ineffective because AI systems can find and exploit less obvious proxies that human regulators would never anticipate.


# Chapter 4: Defining and Measuring Algorithmic Fairness

## Hellman: Conceptual Foundations of Fairness Measurement

Deborah Hellman's article addresses a fundamental conceptual question: what does it mean to measure **algorithmic fairness** (算法公平性)? The technological literature has produced multiple competing fairness metrics, but there has been insufficient philosophical attention to what these metrics actually measure and why they matter morally.

### Two Families of Fairness Metrics

Hellman identifies two dominant families of fairness metrics:

1. **Accuracy-based measures** (准确性度量): These require that algorithmic scores be equally accurate across protected groups. For example, a risk score should have the same **predictive value** (预测值)---the same probability that a person with a given score will actually engage in the predicted behaviour---regardless of group membership.

2. **Error-rate-based measures** (错误率度量): These require equality in the rates of specific types of errors across groups. The two most important error-rate metrics are **false positive rate parity** (假阳性率均等)---the same proportion of each group should be incorrectly classified as positive---and **false negative rate parity** (假阴性率均等)---the same proportion of each group should be incorrectly classified as negative.

<div class="definition">
<strong>Impossibility Result (不可能性结果):</strong> A mathematical theorem demonstrating that it is impossible to simultaneously satisfy certain fairness metrics except in trivial cases. Specifically, an algorithm cannot simultaneously achieve equal predictive values and equal error rates across groups unless the base rates (the actual prevalence of the predicted outcome) are equal across groups, or the algorithm achieves perfect prediction.
</div>

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

### Fairness Definitions

The survey catalogs the major mathematical definitions of fairness:

- **Demographic parity** (人口统计均等): The probability of a positive outcome should be equal across groups. Formally: P(Y-hat = 1 | A = 0) = P(Y-hat = 1 | A = 1), where A is the protected attribute and Y-hat is the predicted outcome.
- **Equalized odds** (均等机会): The true positive rate and false positive rate should be equal across groups, conditional on the actual outcome.
- **Predictive rate parity** (预测率均等): The positive predictive value---the probability that a person classified as positive is actually positive---should be equal across groups.

### The Impossibility Theorem

A central result in the algorithmic fairness literature, which Pessach and Shmueli explain, is the **impossibility theorem** (不可能性定理): except in degenerate cases, no algorithm can simultaneously satisfy demographic parity, equalized odds, and predictive rate parity. This result implies that any practical fairness intervention requires choosing among competing fairness criteria, and this choice is irreducibly normative.

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

### Implications for Algorithmic Fairness

Frye's structural analysis has direct implications for algorithmic fairness. If oppression is systemic rather than individual, then removing individual biases from algorithms is insufficient. An algorithm that treats every individual "equally" will still produce oppressive outcomes if it operates within and draws data from an oppressive social structure. The birdcage cannot be dismantled one wire at a time; similarly, algorithmic fairness cannot be achieved by addressing one variable at a time while leaving the structural context intact.

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

### Shelby's Extension

Shelby argues that Rawls's **fair equality of opportunity** principle can be extended to address racial inequality without fundamentally altering the Rawlsian framework. On this view, racial discrimination violates FEO because it distributes social positions on the basis of morally arbitrary characteristics rather than talent and effort. A Rawlsian approach would therefore condemn racial discrimination as a violation of basic justice and would support robust institutional interventions to ensure that race does not determine life prospects.

Shelby draws a distinction between **racial injustice** (种族不正义) as discrimination and **racist injustice** (种族主义不正义) as oppression, arguing that Rawls's framework can accommodate both: discrimination violates FEO, while oppression violates the basic structure's commitment to treating all persons as free and equal.

<div class="definition">
<strong>Ideal Theory (理想理论):</strong> A mode of political theorizing that develops principles of justice for a perfectly just society---one characterized by full compliance with just institutions and favourable social conditions. Ideal theory asks: what would a fully just society look like? <strong>Non-ideal theory</strong> (非理想理论), by contrast, addresses questions of justice under conditions of partial compliance, historical injustice, and non-ideal circumstances.
</div>

## Mills: Against Ideal Theory

Charles Mills launches a sustained critique of Shelby's approach, arguing that the Rawlsian framework cannot be successfully deployed for racial justice without radical revision. Mills raises five central objections:

### 1. Rawls's Own Silence

Rawls himself never applied his framework to racial justice, despite having ample opportunity to do so. Mills argues that this silence is not accidental but reveals something about the framework's limitations: it was designed to theorize justice under idealized conditions and is poorly equipped to address the messy realities of racial injustice.

### 2. The Ideal Theory Problem

Mills's most fundamental objection concerns the distinction between **ideal theory** and **non-ideal theory**. Rawls developed his principles for an idealized, perfectly just society. But racial injustice is a product of profoundly non-ideal conditions: centuries of slavery, colonialism, and systemic discrimination. Mills argues that ideal theory "obscures the realities of white supremacy and leads people to ignore or misperceive racial injustice." The idealizing assumptions strip away the very features of the social world---racial hierarchy, accumulated disadvantage, epistemic distortion---that any theory of racial justice must address.

### 3. The Priority of Rectificatory Justice

Mills emphasizes that racial justice requires **rectificatory justice** (矫正正义)---corrective measures to address historical wrongs---not merely forward-looking principles for distributing opportunities. The pressing question is not "what principles should govern a perfectly just society?" but "what do we owe to those whose ancestors were enslaved, dispossessed, and systematically exploited?" Rawls's framework, designed for ideal conditions, has no obvious place for such backward-looking considerations.

### 4. Class versus Race

Mills argues that Shelby's attempt to assimilate racial injustice to class injustice---treating race as merely one factor that affects one's position in the social hierarchy---fails to capture the distinctive character of racial oppression. Racial injustice is not simply a matter of unequal distribution; it involves a distinctive kind of status hierarchy, epistemic violence, and cultural erasure that cannot be reduced to economic inequality.

### 5. The Ideology of Ideal Theory

Most provocatively, Mills argues that ideal theory is not merely inadequate but actively harmful: it functions as an **ideology** (意识形态) that serves to maintain white supremacy by diverting philosophical attention away from the real structures of racial domination. By focusing on what a perfectly just society would look like, ideal theory renders invisible the mechanisms of racial injustice that actually exist.

<div class="remark">
<strong>Remark:</strong> The Shelby-Mills debate has direct implications for algorithmic fairness. Approaches that define fairness in ideal-theoretic terms---for example, by asking what outcomes a fair algorithm would produce in a just society---risk the same idealization problem that Mills identifies. If algorithms are deployed in a profoundly unjust society, defining fairness by reference to ideal conditions may produce interventions that are inadequate or even counterproductive.
</div>


# Chapter 7: Algorithmic Affirmative Action

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

## Huq: Racial Equity in Algorithmic Criminal Justice

Aziz Huq provides a sustained analysis of algorithmic tools in the criminal justice system, examining their interaction with the enduring racial dimensions of American criminal justice. His analysis is distinctive in its focus on the *dynamic* effects of algorithmic systems and its critique of existing legal frameworks for evaluating them.

### The Deployment Landscape

Algorithmic tools are now deployed across multiple stages of the criminal justice process:

- **Predictive policing**: Algorithms that predict where crimes are likely to occur, directing police resources to those areas.
- **Bail decisions**: Risk assessment tools that predict whether a defendant will fail to appear or commit a new offence if released before trial.
- **Sentencing**: Risk assessment tools that predict the likelihood of recidivism, informing judges' sentencing decisions.
- **Parole**: Tools that assess the risk of reoffending to inform parole decisions.

### Constitutional Inadequacy

Huq argues that existing **constitutional doctrine** (宪法原则) is poorly suited to evaluate the racial effects of algorithmic criminal justice. The Equal Protection Clause, as interpreted by the Supreme Court, requires proof of **discriminatory intent** (歧视意图)---deliberate purpose to discriminate on the basis of race. But algorithmic discrimination typically occurs without any discriminatory intent on the part of the algorithm's designers or users. The algorithm discriminates because it was trained on biased data, not because anyone intended it to discriminate. Constitutional doctrine, focused on intent, cannot capture this form of discrimination.

<div class="definition">
<strong>Discriminatory Intent Doctrine (歧视意图原则):</strong> The constitutional standard requiring that a plaintiff challenging a facially neutral government action as racially discriminatory must prove that the action was motivated by a deliberate purpose to discriminate on the basis of race. This standard is widely criticized as inadequate to address structural and systemic forms of discrimination.
</div>

### Technical Fairness Standards

Huq also evaluates emerging technical standards of **algorithmic fairness** (算法公平性), finding them valuable but insufficient. Mathematical fairness criteria, such as equalized odds or predictive rate parity, capture important aspects of racial equity but cannot encompass the full range of concerns. They focus on static, point-in-time comparisons and fail to account for the dynamic, long-term effects of algorithmic systems on racial stratification.

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

## Hampton: Black Feminist Musings on Algorithmic Oppression

Lelia Hampton brings **Black feminist theory** (黑人女性主义理论) to bear on algorithmic oppression, drawing on the tradition of feminist science and technology studies to argue that algorithmic systems cannot be understood apart from the structures of racial and gender oppression in which they are embedded.

### Historical Continuities

Hampton situates algorithmic oppression within a longer history of **scientific oppression** (科学压迫) against marginalized communities. From scientific racism and eugenics to contemporary algorithmic discrimination, she traces continuities in the use of ostensibly objective, scientific methods to justify and perpetuate the subordination of Black people, women, and other marginalized groups. Algorithms are not a new phenomenon but the latest iteration of a long tradition of using the authority of science to naturalize social hierarchy.

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

<div class="remark">
<strong>Remark:</strong> Hampton's analysis represents a significant departure from the dominant frameworks in algorithmic fairness. Where mainstream approaches seek to make algorithms fairer within existing social structures, Hampton questions whether fairness within fundamentally unjust structures is meaningful. Her Black feminist perspective insists that the problem is not algorithms per se but the structures of oppression that algorithms encode and perpetuate. This represents a move from reformist to transformative or abolitionist approaches to AI ethics---a move that challenges the entire enterprise of "fair machine learning" as currently conceived.
</div>
