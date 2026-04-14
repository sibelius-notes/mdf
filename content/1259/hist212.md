---
title: "HIST 212: The Computing Society"
prof: "Scott Campbell"
subjects: "HIST"
---

## Sources and References

- Martin Campbell-Kelly, William Aspray, Nathan Ensmenger, and Jeffrey R. Yost. *Computer: A History of the Information Machine*. 3rd ed. Sloan Technology Series. Westview Press, 2013.
- Paul E. Ceruzzi. *A History of Modern Computing*. 2nd ed. MIT Press, 2003.
- Thomas Haigh and Paul E. Ceruzzi. *A New History of Modern Computing*. MIT Press, 2021.
- Nathan Ensmenger. *The Computer Boys Take Over: Computers, Programmers, and the Politics of Technical Expertise*. MIT Press, 2010.
- Janet Abbate. *Inventing the Internet*. MIT Press, 1999.
- Fred Turner. *From Counterculture to Cyberculture: Stewart Brand, the Whole Earth Network, and the Rise of Digital Utopianism*. University of Chicago Press, 2006.
- Mar Hicks. *Programmed Inequality: How Britain Discarded Women Technologists and Lost Its Edge in Computing*. MIT Press, 2017.
- Computer History Museum oral history archive and online exhibits, Mountain View, CA.
- Charles Babbage Institute archival collections, University of Minnesota.

---

# Chapter 1: Why a History of Computing?

## Framing technology historically

Popular stories about computing tend to move in straight lines. A lone inventor has a flash of insight, a garage startup produces a revolutionary machine, and the world is suddenly transformed. Historians of technology are skeptical of this shape. They ask who benefited, who was displaced, which paths were taken and which were abandoned, and why certain designs came to feel inevitable only in hindsight. Studying **the computing society** means treating the computer not as a self-driving force but as a human artifact, shaped at every step by labour markets, military priorities, bureaucratic routines, cultural fantasies, and political struggles.

### The "why not washing machines?" question

The course opens with a deceptively simple puzzle: why do we write triumphant histories of the computer but not of the washing machine? Both devices reorganized daily life. Both automated previously manual labour. Both are now ubiquitous. Yet one carries an aura of destiny and the other is mundane. The answer reveals a bias in how technology is narrated. Computers have been wrapped in rhetorics of intelligence, progress, and modernity that make them look exceptional, while appliances that reshaped the household economy are treated as background furniture. A disciplined history refuses both extremes. It treats every machine as an embedded social object and asks which framing survives scrutiny.

<div class="remark">
<strong>Interpretive note.</strong> Historians such as Ruth Schwartz Cowan argued that household technologies like washing machines often <em>increased</em> the total hours of domestic labour by raising standards of cleanliness. Computing historians make parallel arguments about offices: automation did not simply replace workers but redefined what counted as work.
</div>

## Social construction and path dependence

Two analytical habits run through the course. The first is **social construction**: the recognition that technical artifacts acquire their meaning through negotiation among users, designers, regulators, and competitors. The second is **path dependence**: the recognition that early choices, however contingent, lock in later possibilities. The QWERTY keyboard, the x86 instruction set, the TCP/IP stack, and the A4 paper size are all examples. None was uniquely optimal, yet each became difficult to dislodge once networks of compatible equipment, trained operators, and sunk investments grew up around it.

---

# Chapter 2: Computing Before Computers

## Calculation as craft and commerce

Long before electronics, people computed. Merchants kept accounts with the abacus, astronomers used trigonometric tables, and seventeenth-century scholars like John Napier published logarithms to shorten multiplication. By the nineteenth century, computation had become a craft industry. Teams of clerks, many of them women, produced astronomical almanacs, insurance tables, and ballistics firings using pencil, paper, and mechanical calculators. The word **computer** itself, until the late 1940s, referred to a person who computed for a living.

<div class="definition">
A <strong>computer</strong> (historical sense, roughly 1610 to 1945) is a human worker whose job is to perform arithmetic, typically in a room alongside other such workers, under a supervisor who distributes problems and collates results.
</div>

## Babbage, Lovelace, and the unbuilt engine

Charles Babbage's *Difference Engine* and the more ambitious *Analytical Engine*, designed in the 1820s and 1830s, are often cited as the conceptual ancestors of the modern computer. Babbage envisioned a mechanical device that could, in principle, store numbers, execute a sequence of operations, and branch based on intermediate results. Ada Lovelace's annotations to a French description of the engine speculated that such a machine might one day manipulate symbols other than numbers, including musical notation. Neither engine was completed in Babbage's lifetime, and historians now debate whether his ideas directly influenced later designers or were rediscovered. The point is not paternity but the recognition that the logical structure of programmable calculation was imaginable well before the physical means existed.

## Hollerith, the punch card, and the mechanical office

The mechanization that did spread was not Babbage's. It was the **punch card** tabulator developed by Herman Hollerith for the 1890 United States Census. Holes punched into stiff paper represented categorical and numerical data, and electromechanical readers could sort, count, and tabulate cards at speeds that dwarfed manual methods. Hollerith's company eventually became *International Business Machines*, and by the 1930s the IBM punch card had colonized insurance, railway scheduling, payroll, and inventory.

<div class="example">
<strong>Case: the 1890 US Census.</strong> The 1880 census took almost a full decade to tabulate. By buying Hollerith's machines, the Census Bureau finished the 1890 count in roughly a quarter of the time, even though the population had grown. The success established a template in which government data problems drove commercial machine design, a pattern that would repeat through the twentieth century.
</div>

### Gender in the mechanical office

Campbell-Kelly and Aspray describe the interwar office as a site where women took on most keypunch and verifier roles, while men retained supervisory and maintenance positions. Hicks' work on British civil service computing extends this analysis, showing how routine machine labour was feminized and then devalued, with lasting consequences for who was admitted into programming when electronic computers arrived.

---

# Chapter 3: Inventing the Electronic Computer

## Wartime and the first electronic machines

World War II is the usual pivot in histories of computing, not because war invented new ideas, but because it supplied urgent problems, unlimited budgets, and secrecy that concealed parallel developments. In Britain, the codebreakers at Bletchley Park built *Colossus*, a room of vacuum tubes used to attack the Lorenz cipher. In the United States, the Moore School of Electrical Engineering built *ENIAC* to compute artillery firing tables for the Army. In Germany, Konrad Zuse's *Z3* used electromechanical relays. Each machine answered local constraints; none was a direct ancestor of the others.

## The stored-program idea

The conceptual leap that organizes the rest of the century is the **stored-program** architecture. In a stored-program computer, instructions live in the same memory as data and can be manipulated as data. This idea is usually associated with John von Neumann's 1945 draft report on the *EDVAC*, though historians note that it crystallized ideas already circulating among the ENIAC team, including J. Presper Eckert and John Mauchly, and that Alan Turing's theoretical work on computable functions provided a logical framework. Credit disputes continue. Haigh and Ceruzzi argue that no single document or person "invented" the modern computer; rather, a cluster of machines between roughly 1945 and 1951 converged on a shared architecture through overlapping correspondence, conferences, and personnel transfers.

<div class="definition">
The <strong>stored-program architecture</strong> (sometimes called the von Neumann architecture) organizes a computer around a memory that holds both instructions and data, a central processor that fetches instructions sequentially, and input/output channels. It makes software possible as an independent commodity, because programs become data that can be written, copied, and modified without rewiring the machine.
</div>

## From laboratories to industry

The first commercial machines followed quickly. The British *LEO*, run by the Lyons tea company, handled payroll and bakery logistics. The American *UNIVAC* famously predicted the 1952 US presidential election on live television, anchoring computing's public image. IBM, initially cautious, entered the electronic market with the 701 and rose to dominance through a combination of sales culture, service bureaus, and compatibility with existing punch card installations. The story here is not that the best machine won, but that the firms best embedded in existing data-processing ecosystems were best positioned to convert their customers.

---

# Chapter 4: The Business Machine

## The IBM System/360 and the idea of a product line

By the early 1960s, computer buyers faced a frustrating problem. Every new machine was incompatible with the last, requiring programs to be rewritten and operators retrained. In 1964 IBM gambled the company on the *System/360*, a family of machines sharing a single instruction set but spanning a wide range of performance and price. A program written for the smallest 360 could run, unchanged, on the largest. The architecture became a template for how computer product lines were designed for decades, and it shifted the industry's centre of gravity from hardware toward compatible software.

<div class="remark">
The 360 gamble also illustrates how historical contingency produces apparent inevitabilities. IBM's internal engineering teams were deeply divided; had the project failed, the company might have fragmented. Instead, its success made backward compatibility a near-sacred commitment across the industry, one reason modern Intel chips still implement decades-old instructions.
</div>

## Time-sharing and the computer utility

In the same period, researchers at MIT, Dartmouth, and elsewhere pursued **time-sharing**, a technique that lets many users interact with a single machine simultaneously by rapidly rotating their programs through the processor. The vision articulated by figures like John McCarthy and Fernando Corbato was that computing would become a utility, piped into homes and offices like electricity. *Multics*, the MIT/GE/Bell Labs time-sharing project, was enormous, ambitious, and, in commercial terms, a disappointment. Its most important legacy was a set of ideas that two Bell Labs engineers, Ken Thompson and Dennis Ritchie, distilled into a smaller system they called *UNIX*.

## Software becomes a product and a profession

Ensmenger's *The Computer Boys Take Over* traces how programming, initially treated as low-status clerical work done by women, was reframed in the 1960s as a masculine technical profession. Aptitude tests, certification schemes, and professional associations redrew the boundaries. At the same time, software emerged as a separate commercial category. The 1969 "unbundling" decision by IBM, in which the company began charging separately for software and services, is often cited as the birth of the independent software industry. Firms like Computer Sciences Corporation, Applied Data Research, and later Microsoft could sell programs rather than only machines.

---

# Chapter 5: Personal Computing

## From the minicomputer to the microprocessor

Between the mainframe era and the personal computer era sat the **minicomputer**, a refrigerator-sized machine pioneered by Digital Equipment Corporation and its *PDP* family. Minicomputers put interactive computing within reach of university departments, engineering firms, and small businesses, and they normalized the idea that a computer could belong to a group rather than to an institution. The next shrinkage came with the **microprocessor**. Intel's 4004 (1971) and 8080 (1974) packed a processor onto a single integrated circuit, making it plausible to imagine a computer that an individual could own.

## The hobbyist moment

The 1975 *Altair* 8800, marketed as a build-it-yourself kit in *Popular Electronics*, catalyzed the hobbyist computer movement. Clubs like the Homebrew Computer Club in Silicon Valley swapped schematics and software. Young enthusiasts, including Steve Wozniak, Steve Jobs, Bill Gates, and Paul Allen, moved easily between hobbyist and commercial roles. Turner's *From Counterculture to Cyberculture* argues that this generation drew on 1960s countercultural ideals, particularly those curated by Stewart Brand's *Whole Earth Catalog*, to frame personal computing as a tool of individual liberation. The framing stuck, shaping Silicon Valley self-image for decades.

<div class="example">
<strong>Case: Xerox PARC.</strong> While Silicon Valley hobbyists soldered boards, researchers at Xerox's Palo Alto Research Center were inventing the graphical user interface, the laser printer, Ethernet networking, and the object-oriented language Smalltalk. Xerox famously failed to commercialize most of these inventions. When Steve Jobs visited PARC in 1979, he came away convinced that the mouse-driven desktop was the future, and Apple's *Lisa* and *Macintosh* took the idea to market. The episode is often told as a story of corporate blindness, but historians emphasize that PARC's research culture depended on Xerox money and that the technology transfer happened through people, not through theft.
</div>

## The IBM PC and the rise of the clone

In 1981, IBM released a personal computer built largely from off-the-shelf parts and a non-exclusive operating system licensed from a small firm called Microsoft. The decision was expedient; IBM wanted a machine quickly and did not regard personal computing as central to its business. The unintended consequence was that other manufacturers could legally build compatible clones, and that Microsoft's *MS-DOS*, later *Windows*, became a de facto standard. By the late 1980s, the PC market belonged to the clone makers and to Microsoft, while IBM's proprietary alternatives struggled. The episode is a textbook illustration of how platform economics can escape the intentions of their creators.

---

# Chapter 6: Networks and the Internet

## ARPANET and packet switching

The **ARPANET**, funded by the US Department of Defense's Advanced Research Projects Agency and launched in 1969, is the ancestor of the modern Internet. Janet Abbate's *Inventing the Internet* stresses that its design reflected the values of its builders: academic computer scientists who prized decentralization, robustness, and openness. The core innovation was **packet switching**, in which messages are broken into small, independently routed packets rather than sent over dedicated circuits. Paul Baran at RAND and Donald Davies at the UK's National Physical Laboratory developed the idea in parallel, each motivated by different concerns: Baran by nuclear survivability, Davies by efficient interactive computing.

## TCP/IP and the inter-network

The ARPANET became the *Internet* when Vint Cerf and Robert Kahn's *TCP/IP* protocols allowed different networks, built on different hardware, to exchange traffic through gateways. The decisive switch from the older NCP protocol to TCP/IP in 1983 is sometimes called the Internet's birthday. What mattered was not a single moment but an architectural principle that Abbate calls the **end-to-end principle**: the network should move bits reliably and leave intelligence to the endpoints. This decision kept the core simple and allowed new applications, from email to video streaming, to be deployed without rewiring the middle.

## The Web and its discontents

Tim Berners-Lee's *World Wide Web*, developed at CERN in 1989 and released freely in 1991, layered a hypertext application on top of TCP/IP. It added three simple ingredients: URLs to name resources, HTTP to transfer them, and HTML to format them. The Web's openness was not inevitable. Commercial online services such as CompuServe, Prodigy, and AOL initially built walled gardens, and only reluctantly connected to the broader Internet when users demanded it. By the late 1990s the Web had absorbed them. Haigh and Ceruzzi emphasize that the Web's apparent triumph rested on policy decisions, particularly the US government's 1995 withdrawal from operating the Internet backbone, which opened the network to commercial traffic.

<div class="definition">
The <strong>end-to-end principle</strong> holds that application-specific intelligence should live at the network's edges (in the sending and receiving computers), not in the routers in the middle. This principle made it cheap to add new applications but also made network management, security, and accountability harder.
</div>

---

# Chapter 7: Software, Labour, and Identity

## UNIX and the culture of systems

*UNIX*, born at Bell Labs in the early 1970s, spread through universities under cheap licenses and became the lingua franca of academic computing. Its culture valued small, composable tools, plain text, and readable source code. When AT&T tried to commercialize UNIX in the 1980s, Richard Stallman's *GNU Project* and, later, Linus Torvalds' *Linux* kernel produced a free alternative. The resulting free and open source software movement is more than a licensing technicality. It encodes a political claim about who should control the tools that run society.

## Who counts as a programmer?

The gendered history of software is a throughline of the course. In the 1940s, the ENIAC programmers were six women, selected from the human-computer pool, whose expertise in configuring the machine was treated as clerical rather than intellectual. Grace Hopper, whose work on compilers shaped early high-level languages, argued that programming could be democratized through English-like syntax, a claim that was sometimes used against her by colleagues who preferred machine-level control. Hicks' *Programmed Inequality* shows that the British state deliberately pushed women out of computing roles in the 1960s, with devastating consequences for the UK industry. Ensmenger documents how American employers used personality tests and puzzle-solving batteries that encoded cultural assumptions about who "looked like" a programmer, narrowing the pipeline for decades.

<div class="remark">
<strong>Methodological note.</strong> Historians of gender in computing warn against both erasure and tokenism. It is not enough to list a few famous women alongside a male canon; the task is to show how gendered labour structures shaped which problems were considered worth solving, which skills were rewarded, and which were made invisible.
</div>

## Hackers, counterculture, and Silicon Valley mythology

Fred Turner's work argues that the Silicon Valley self-image (informal, anti-hierarchical, world-changing) was not a natural property of small computers. It was constructed in the 1970s and 1980s through magazines, conferences, and networks that linked 1960s communalists to Stanford researchers and venture capital. This mythology has had practical consequences: it underwrites claims that digital industries should be exempt from regulation and it obscures the military and corporate funding that made personal computing possible in the first place.

---

# Chapter 8: Platforms, Mobility, and the Present

## The smartphone as a general-purpose device

The 2007 release of Apple's iPhone and the subsequent rise of Android turned the phone into a general-purpose computer with a wireless internet connection, a camera, a location sensor, and a curated application store. Historians of the present still disagree about how to narrate this shift, but several things are clear. Computing ceased to be tied to a desk. The platform owner, rather than the device buyer, increasingly decides what software can run. And the economics of attention, measured in notifications and engagement metrics, became a central design problem.

## Search, social media, and surveillance

Google's rise on the strength of its *PageRank* algorithm, and the growth of Facebook, Twitter, YouTube, and their successors, concentrated information flow into a small number of privately governed platforms. Scholars such as Shoshana Zuboff have described the resulting business model as **surveillance capitalism**: the extraction of behavioural data at scale to target advertising and to predict and shape future behaviour. Whether one accepts that label or prefers alternatives, the historical point is that the open, decentralized Web imagined in the 1990s has been overlaid by a platform layer with very different properties.

## Algorithmic systems, AI, and accountability

Machine learning systems trained on large datasets now mediate loan decisions, hiring, content moderation, medical triage, and criminal justice. Researchers including Safiya Umoja Noble, Ruha Benjamin, and Timnit Gebru have documented how these systems reproduce and sometimes amplify historical inequalities, in part because their training data encodes them. The rise of large language models in the 2020s has extended these debates into new territory around labour, intellectual property, and energy use. A historical perspective reminds us that every previous wave of automation provoked similar debates and that the outcomes depended less on the technology itself than on the regulatory, economic, and cultural frameworks built around it.

<div class="example">
<strong>Case: content moderation labour.</strong> The cheerful interfaces of modern social media depend on tens of thousands of contract workers, often in the Philippines, Kenya, and India, who review disturbing material so that end users do not have to. This hidden labour parallels the hidden keypunch operators of the 1930s office: in both cases, visible automation conceals an invisible workforce whose conditions rarely enter the marketing story.
</div>

---

# Chapter 9: Doing History with Material Artifacts

## Why objects matter

The course treats physical artifacts, old manuals, slide rules, punch cards, early laptops, not as curios but as evidence. An object carries traces of the assumptions its designers made about users, the materials and labour available, and the regulatory environment in which it was sold. Reading a 1970s calculator manual, for instance, reveals what mathematical literacy the designers expected, what metaphors they used to explain memory, and what they thought deserved a dedicated key.

## Historical thinking as a transferable skill

The goal of historical thinking in a computing course is not to memorize names and dates. It is to practice a set of habits: distinguishing evidence from assertion, situating sources in their contexts, recognizing contingency where others see inevitability, and attending to voices and labour that standard narratives omit. These habits travel well. A software engineer who understands why the QWERTY keyboard persisted is better prepared to reason about why a given API, data format, or organizational practice persists in their own workplace.

| Historical habit | Question it asks | Example from computing history |
| --- | --- | --- |
| Contingency | Could this have gone differently? | IBM's accidental creation of the PC clone market |
| Context | What conditions made this possible? | Cold War funding behind ARPANET |
| Causation | What combination of forces produced this outcome? | The 1969 IBM unbundling and the software industry |
| Complexity | Whose experiences are missing? | Feminized keypunch labour in the interwar office |
| Change and continuity | What persists across apparent revolutions? | Punch card data formats surviving into early COBOL |

<div class="remark">
<strong>Closing thought.</strong> A critical history of computing is not a catalogue of failures. It is a refusal to let the marketing departments of successful firms write the first draft. Done well, it equips readers to ask better questions about the next wave of machines, which, like the washing machine and the mainframe before them, will arrive accompanied by confident stories about how everything is about to change.
</div>
