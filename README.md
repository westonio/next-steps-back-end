# Next Steps - Project README
# Back-End

Link to [Next Steps Website](https://next-steps-front-end-4778e35e4143.herokuapp.com/)
## Table of Contents

1. [Project Description](#project-description)
3. [Usage](#usage)
4. [Endpoints](#endpoints)
5. [Future Iterations](#future-iterations)
6. [Suggestions for Contribution](#suggestions-for-contribution)
7. [Contributors](#contributors)

## Setup
- Ruby 3.2.2
- Rails 7.0.7.2
- [Faraday](https://github.com/lostisland/faraday) gem to interact with APIs
- [JSONAPI Serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) gem for formatting JSON responses
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) gem for code coverage tracking
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers) gem for testing assertions
- [VCR](https://github.com/vcr/vcr) / [Webmock](https://github.com/bblimke/webmock) to stub HTTP requests in tests to simulate API interactions

## Project Description

**Next Steps** is full-stack project that leverages the [211 API](https://apiportal.211.org) along with geolocation to assist individuals in finding community resources in their vicinity.  We thought it was particularly important to create search options catered to persons who may not have the ability to navigate existing resources. This repository contains the back-end portion of the project, providing an API for the [front-end application](https://github.com/westonio/next-steps-front-end).

This project has been deployed using [Heroku](https://id.heroku.com/login), and [Circle CI](https://circleci.com/) was used for Continuous Integration.


### User-Friendly Resource Access
- Users of the app can access community resources anonymously.
- Pre-built search queries are available to streamline the resource-finding process.
- An option to search for resources using keyword endpoints from 211 API.  

### Provider Profiles
- Service providers can create accounts to add information about their specific services.
- Providers offering specialized services such as housing for justice-affected individuals, LGBTQIA+ friendly services, emergency shelter, or any service relevant to vulnerable communities can create profiles to make their services searchable.
- Provider application are reviewed by Admin users and can be approved or denied by Admin.

## Usage

This API was created to expose endpoints for specialized search queries and used with the sister front-end application.  The endpoint takes in two parameters, "keyword" and "location".  We provide the user with some keywords built in, such as "basic needs", "shelters", "medical care", "mental health care", and others.  They can select keywords from our provided options, or utilize the search bar to search their own keyword(s).

## Endpoints
### Will return the first 10 results from the search

1. `GET /api/v0/search?keyword=="checkbox"&location="location_entry"`
      * Try it out: https://ancient-reaches-38594-79ad833137d5.herokuapp.com/api/v0/search?keyword=healthcare&location=denver


### If you are dealing with providers that register with our service use:  

1. `POST /api/v0/providers`
2. `GET /api/v0/providers/:id`
3. `PATCH /api/v0/providers/:id`
4. `DELETE /api/v0/providers/:id`

### If you are dealing with providers that exist from 211 database use: 

1. `GET /api/v0/provider_details/:211_id`

### The Endpoints we are utilizing from the 211 Search API are:  
  *note: The 211 allows trial usage, it will only give you the first 10 results;*
  *You must get an API key to access any part of the 211 API, We hid ours by utilizing built in Rails Credentials.*

1. `GET https://api.211.org/search/v1/api/Search/Keyword?Keyword=#{keyword}&Location=#{location}&Distance=10`
    
2. `GET https://api.211.org/search/v1/api/ServiceAtLocation?idServiceAtLocation=#{service_id}`
    * The Service ID can be accessed from the JSON response from the first endpoint 

    
## Future Iterations

- Scale: Utilize cloud storage to store data for Providers and resource list saved by user.  
- Utilize [Open AI API](https://openai.com/blog/openai-api) for generating motivational statements based on user's identified needs.
- Create additional pre-built search options that make finding resources easy and convenient.
- Admin functionality.

## Suggestions for Contribution

If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or endpoint. e.g., `git checkout -b <your-feature>`
3. Commit your changes: `git commit -m "Add new feature"`
4. Push the branch to your fork: `git push origin your-feature`
5. Create a pull request outlining your changes.

## Contributors

- [Allen Russell](allenrusselldev@gmail.com) - GitHub: [@garussell](https://github.com/garussell)
- [Weston Schutt](wtschutt@gmail.com)        - GitHub: [@westonio](https://github.com/westonio)
- [Kaina Cockett](kainacockett@gmail.com)    - GitHub: [@kcockett](https://github.com/kcockett)
- [Zanna Fitch](zannafitch@gmail.com)        - GitHub: [@z-fitch](https://github.com/z-fitch)
- [Jorja Flemming](aset284@gmail.com)        - GitHub: [@jorjaf](https://github.com/jorjaf)