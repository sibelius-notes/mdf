---
title: "ECE 457C: Reinforcement Learning"
prof: "Mark Crowley"
subjects: "ECE"
---

## Sources and References

**Equivalent UW courses** — CS 486/686 (Introduction to Artificial Intelligence), CS 885 (Reinforcement Learning)
**Primary textbook** — Richard S. Sutton and Andrew G. Barto, *Reinforcement Learning: An Introduction*, 2nd edition, MIT Press, 2018
**Supplementary references** — Dimitrakakis and Ortner, *Decision Making Under Uncertainty and Reinforcement Learning*; Ghavamzadeh et al., *Bayesian Reinforcement Learning: A Survey*, 2016

## Equivalent UW Courses

ECE 457C lines up most closely with CS 885 (Pascal Poupart's reinforcement-learning course) — both work through the Sutton and Barto textbook and cover MDPs, dynamic programming, TD methods, function approximation, and deep RL. CS 486/686 is the cross-listed undergrad/grad intro-to-AI course (one course, two numbers) and touches MDPs and basic RL in one or two lectures inside a much broader survey of search, logic, probability, Bayes nets, and ML, so it overlaps ECE 457C only at the MDP/RL segment. In practice ECE 457C gives engineering undergraduates a CS 885-style experience tuned for an undergraduate workload.

## What This Course Adds Beyond the Equivalents

Compared with CS 486/686, ECE 457C goes much deeper into RL specifically — it is not a broad AI survey, and the assignments force students to implement SARSA, Q-learning, DQN, and policy-gradient methods in Python rather than just discussing them. The course also explicitly makes the connection to control theory, which is natural for ECE students and less emphasized in the CS equivalents. What it omits relative to CS 885 is the research-paper reading component and some of the more theoretical material (PAC bounds, convergence proofs in detail, bandit regret analysis), and unlike CS 486/686 it does not cover logic, knowledge representation, or classical search.

## Topic Summary

### Motivation and Probability Review

Why reasoning under uncertainty matters; the place of RL inside machine learning and AI; a quick refresher on probability, expectation, and conditional distributions. Sets up the vocabulary for everything that follows.

### Multi-Armed Bandits

Exploration versus exploitation in the simplest non-trivial setting, with epsilon-greedy, UCB, and Thompson sampling. Bandits are MDPs without state, and the regret framework introduced here recurs throughout RL.

### Markov Decision Processes

An MDP is the tuple \( (S, A, P, R, \gamma) \) with transition probabilities \( P(s' \mid s, a) \) and reward function \( R(s, a) \). The discounted return and the value function \( V^{\pi}(s) \) are the central objects of study.

### Solving MDPs: Bellman Equations and DP

The Bellman expectation and optimality equations express \( V^{*} \) as a fixed point, and value iteration and policy iteration are the two canonical dynamic-programming solvers. Connection to control theory (LQR, Bellman's principle of optimality) is made explicit.

### SARSA and Q-Learning

Model-free TD control: SARSA is on-policy, Q-learning is off-policy, and both update

\[ Q(s, a) \leftarrow Q(s, a) + \alpha\bigl[r + \gamma \max_{a'} Q(s', a') - Q(s, a)\bigr] \]

from single transitions. These are the workhorses of tabular RL.

### Temporal Difference Learning with Eligibility Traces

TD(\(\lambda\)) and eligibility traces interpolate between one-step TD and full Monte Carlo returns, trading bias against variance. Gives a unified view of the return-estimation spectrum.

### State Representation and Value Function Approximation

When \( S \) is too large to tabulate, \( V \) and \( Q \) are approximated by parametric functions trained with stochastic gradient descent. Linear features first, then neural networks.

### Neural Network Basics

Fully connected MLPs, backpropagation, CNNs and LSTMs, and regularization. Reviewed only enough to support deep-RL methods later.

### Deep Q-Networks

DQN replaces the Q-table with a neural network and stabilises training with experience replay and a target network. The Atari results that launched modern deep RL are the motivating example.

### Policy Gradients and Actor-Critic

REINFORCE estimates \( \nabla_\theta J(\theta) = \mathbb{E}[\nabla_\theta \log \pi_\theta(a\mid s)\, Q^{\pi}(s,a)] \), and actor-critic methods reduce variance by learning a value baseline. Opens the door to continuous-action RL.

### Advanced Algorithm Variants

A3C, A2C, DPG, DDPG, TRPO, PPO, SAC, and decision transformers as points in the design space of modern deep RL. Students see why there is no single winner.

### Monte Carlo Tree Search

MCTS as an anytime planning algorithm for (PO)MDPs, and the AlphaGo/AlphaZero architecture that combines MCTS with learned value and policy networks. Ties planning and learning together.

### Human Preference and Moral Reasoning

RLHF for large language models and the use of RL concepts in theories of human moral cognition. A short look at where the field is going beyond traditional control problems.
