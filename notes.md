Subscription Tracking App

Purpose: This app's purpose is to allow you to track your current paid subscriptions.

User Experience: I want my users to be able to easily enter a new subscription with a service name, category, start date and total recurring fee. A nice visual breakdown via pie chart could be a nice addition to the app. [Manage Recurring Payments & Subscriptions \| Harvest](https://www.joinharvest.com/products/recurring-payments)

User Story:

> as a user
> i want to track all paid subscriptions
> so i can be aware of how much i'm spending per month

*MODELS*

- User: has many subscriptions, has many services through subscriptions
  [rails g model User username email password_digest service:references]
- Service: has many subscriptions, has many users through subscriptions
  [rails g model Service name:string user:references]
- Subscription: belongs to user, belongs to service
  [rails g model Subscription fee:integer billing:dt user:references service:references]


*SCHEMA*

- User: username:string, email:string, password_digest:string, service:references
- Service: name:string, user:references
- Subscription: fee:integer, billing:datetime, user:references, service:references

Checklist

x Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
x Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
x Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
x Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)

Resources:

[Brush up Your Knowledge of Rails Associations - SitePoint](https://www.sitepoint.com/brush-up-your-knowledge-of-rails-associations/)