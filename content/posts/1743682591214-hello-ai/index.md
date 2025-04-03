---
title: "First Time Dipping my Toes into AI"
date: 2025-04-03
draft: false
description: "I this post I try and implement an AI powered smart reordering system to learn how to programmatically manipulate basic AI functionality"
tags: ["AI", "101"]
---

*This is a work in progress and subject to change as is still in its infancy.*

# The problem
A super market chain needs to embed a product inside their web application that optimizes the grocery shopping experience of it's customers. In greater detail
customers in the retail food industry often struggle with reordering essentials efficiently, leading to missed purchases, stockouts at home, and irrelevant 
product recommendations. While subscription models exist, they lack true personalization—failing to consider individual shopping frequency, lifestyle preferences
(health-conscious, budget-focused, premium), and real-time consumption patterns. In other words there is a need to Develop an AI-driven smart reordering system 
that predicts when customers need to replenish products based on purchase frequency, household size, consumption patterns, and lifestyle preferences 
(e.g., budget-conscious, healthy shopper, premium buyer). The system should generate intelligent suggested orders, which customers can approve, modify, or
auto-purchase via an omni-channel experience (app, web, or in-store pickup).

## Breaking down the problem
At first in order for the product to be developed and shipped efficiently the correct development cycle must be chosen. For this I was thinking of choosing extreme
programming as it aligns well with sensitive customer data and is also quite agile. Also it shall be an attempt to democratize this sector as most competitive
products are only implemented internally for their customers and are very closed source.

### Creating Issues
To create the correct issues is to do brainstorming in a narrow manner. In greater detail the issues describe the user experience and provide guidelines for the
user interface.

As a user I
- want to see a basket with the products I order most commonly
- want to see suggestions of probable products I may need
- want to green light a recurring order with some basic necessities
- want to chat with an agent to add products to my basket for a specific recipe or a function
- want to set preferences like budget, calories etc.

However it is also important to define an Administrator role to oversee the user-AI interaction.
As an admin I
- need to check for errors and prevent overflows
- need to track stagnant orders
- need to predict demand based on active orders
- modify supply chains based on price fluctuations while fulfilling customer needs.

Getting more specific a UML Diagram can describe the interface and the interactions.
{{< mermaid >}}
sequenceDiagram
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
    Alice-)John: See you later!
    
{{< /mermaid >}}
