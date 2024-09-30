---
slug: owasp-api-security-rules
title: OWASP API Security~
description: What do they got in there? King Kong? You're a very talented young man, with your own clever thoughts and ideas. Do you need a manager? I was part of something special. Did he just throw my cat out of the window? Do you have any idea how long it takes those cups to decompose.
image: ../attachments/100.jpg
date: 2024-06-12T15:30:36+05:30
lastmod: 2024-03-01T23:30:47+08:00
hidden: false
---


I am preparing for an interview and noticed that the job description mentions knowledge of OWASP is required. Since I didn't know what it was, I did what any reasonable person would do—I googled it. Googling only gives you a surface level of information, and for me, that’s never enough. I try to reach at least a 5/10 level of understanding when I learn any subject, and that’s when I feel satisfied. So, I dug deeper and found this free course about [OWASP API Security by APISEC University](https://university.apisec.ai/products/owasp-api-security-top-10-and-beyond). I enrolled and learned more about it, and here is a blog about the things that I learned.

## Introduction

OWASP stands for Open Web Application Security Project, which is a non-profit organization that researches common security vulnerabilities found in modern software.

OWASP is popular for the Top 10 List of Security Vulnerabilities that they release each year. Having this common knowledge on security vulnerabilities helps developers avoid these vulnerabilities in the first place and develop and deliver more secure software.

Here are some common vulnerabilities from the TOP 10 in no particular order:
![OWASP](/owaps.png)

## BOLA Vulnerabilities
Broken Object Level Authorization (BOLA) is one of the most prevalent and severe vulnerabilities for APIs. BOLA vulnerabilities occur when an API provider does not have sufficient controls in place to enforce authorization. In other words, API users should only have access to sensitive resources that belong to them. When BOLA is present, an attacker can access the sensitive data of other users.

## Broken Authentication
Broken authentication refers to any weakness within the API authentication process. All APIs that contain sensitive information should have some mechanism to authenticate users. Authentication is the process used to verify the identity of an API user, whether that user is a person, device, or system. In other words, authentication is the process of verifying that an entity is who that entity claims to be.

This verification process is normally done with the use of a username and password, token, and/or multi-factor authentication.

- Common Causes
---
- Weak password policy - passwords can be easily guessed and breached. Solution: enforce a strong password policy.
- Allows brute force attempts against user accounts. Solution: set a limit for such attempts.
- Allows users to change their password without asking for password confirmation.
- Allows users to change their account email without asking for password confirmation.
- Discloses token or password in the URL.
- GraphQL queries allow for many authentication attempts in a single request.
- Lacks authentication for sensitive requests.
- Credential stuffing.
- Predictable tokens.
- Misconfigured JSON Web Token (JWT), such as accepting unsigned JWTs, not checking JWT expiration, exposing sensitive information within the encoded JWT payload, signing with a weak key, lacking rate limiting, and lockout protections.

## BOPLA
Broken Object Property Level Authorization (BOPLA) combines two items from the 2019 OWASP API Security Top Ten: excessive data exposure and mass assignment.

Excessive data exposure occurs when an API provider responds to a request with an entire data object. Usually, an API provider will filter the data object down to what is being requested. When the data object is shared without being filtered, there is an increased risk of exposing sensitive information.

Mass assignment is a weakness that allows user input to alter sensitive object properties. If, for example, an API uses a special property to create admin accounts, only authorized users should be able to make requests that successfully alter those administrative properties. If there are no restrictions in place, an attacker would be able to elevate their privileges and perform administrative actions.

## Unrestricted Resource Consumption
Unrestricted Resource Consumption is an API issue where the provider of the API does not have safeguards in place to prevent excessive use of their API. When there are no restrictions for resource consumption, the API provider could become a victim of Denial of Service (DoS) attacks or experience unnecessary financial costs. Unrestricted Resource Consumption is an updated version of API4:2019 Lack of Resources and Rate Limiting.

## Broken Function Level Authorization
Broken Function Level Authorization (BFLA) is a vulnerability where API functions have insufficient access controls. Where BOLA is about access to data, BFLA is about altering or deleting data. Additionally, a vulnerable API would allow an attacker to perform actions of other roles, including administrative actions.

To drive the point home, a fintech API susceptible to BOLA would allow an attacker to see what is in another user's bank account, while the same API vulnerable to BFLA would allow an attacker to transfer funds from other users' accounts to their own.

## Unrestricted Access to Sensitive Business Flows
Unrestricted Access to Sensitive Business Flows represents the risk of an attacker being able to identify and exploit API-driven workflows. If vulnerable, an attacker will be able to leverage an organization's API request structure to obstruct other users. This obstruction could come in the form of spamming other users, depleting the stock of highly sought-after items, or preventing other users from using expected application functionality.

## Server-Side Request Forgery (SSRF)
Server-Side Request Forgery (SSRF) is a type of computer security exploit that allows an attacker to access or manipulate information on a server that would otherwise be inaccessible. In an SSRF attack, the attacker sends a malicious request to a web server that then forwards it to the back-end server on the internal network. The server then processes the request and returns a response, which can potentially reveal sensitive information or allow the attacker to perform unauthorized actions.

## Security Misconfiguration
Security Misconfiguration represents a catch-all for many vulnerabilities related to the systems that host APIs. When an API's security is misconfigured, it can be detrimental to the confidentiality, integrity, and availability of the API provider's data. Due to the wide variety of flaws that could exist, the impacts of an exploited security misconfiguration can range from information disclosure to a data breach.

## Improper Inventory Management
Improper Inventory Management represents the risks involved with exposing non-production and unsupported API versions. When this is present, the non-production and unsupported versions of the API are often not protected by the same security rigor as the production versions. This makes improper inventory management a gateway to other API security vulnerabilities.

## Unsafe Consumption of APIs
Unsafe Consumption of APIs is the only item on the top ten list that focuses less on the risks of being an API provider and more on the API consumer. Unsafe consumption is really a trust issue. When an application is consuming the data of third-party APIs, it should treat those with similar caution as user input. By that, I mean there should be little to no trust. So, data consumed from third-party APIs should be treated with similar security standards as end-user-supplied input. If a third-party API provider is compromised, then that insecure API connection back to the consumer becomes a new vector for the attacker to leverage. In the case of an insecure API connection, that could mean the complete compromise of organizations insecurely consuming data from that provider.

## Injection
Injection vulnerabilities have plagued web applications for over two decades. They take place when an attacker is able to send commands that are executed by the systems that support the web application. The most common forms of injection attacks are SQL injection, Cross-site Scripting (XSS), and operating system command injection. APIs are yet another attack vector for these critical attacks to be communicated from an attacker to the supporting databases and systems.

## Insufficient Logging and Monitoring
Logging and monitoring are necessary and important layers of API security. In order to detect an attack against an API, an organization must have monitoring in place. Without sufficient logging and monitoring, an API provider is operating in the dark, and API attacks are guaranteed to go unnoticed until it is far too late.

## Business Logic Flaws
Business logic vulnerabilities are weaknesses within applications that are unique to the policies and features of a given API provider. The exploitation of business logic takes place when an attacker leverages misplaced trust or features of an application against the API. Identifying business logic vulnerabilities can be challenging due to the unique nature of each business. The impact of these vulnerabilities can range based on the severity of the vulnerable policy or feature.
