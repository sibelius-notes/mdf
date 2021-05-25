---
layout: default
title: Home
nav_order: 0
---
## Welcome
Welcome to the Markdown collections of [n.sibp.ro](https://n.sibp.ro)

Check the table of contents to get started. This website currently contains all markdowns but no [pdfs](../pdf/)...

**Disclaimer**: Most of these notes are written in their entirety by me, Sibelius Peng, while attending lectures at the University of Waterloo. I have no intentions of violating any UW policies and will gladly honour takedown notices produced by an authorized UW representative. They are by no means authoritative so use at your own peril.

{% assign total = 0 %}
{% for post in site.pages %}
    {% if post.layout == "toc" %}
        {% assign wordCount = post.content | number_of_words %}
        {% assign total = total | plus: wordCount %}
    {% endif %}
{% endfor %}

## Statistics
- Number of courses: {{ site.layouts.toc | size }}
- Word count: {{ total }}

Last updated: {% include ts.html %}
