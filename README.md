Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices







My original header had spaces in column names like concave points_mean, concave points_se, concave points_worst.

Snowflake (and dbt when generating SQL) does not allow spaces in column names unless quoted, but dbt expects clean, underscore-separated headers for seeds.

Also, it was trying to interpret types like float8 from somewhere in the CSV or schema, which led to syntax errors.

By updating the CSV header to replace spaces with underscores (e.g., concave_points_mean instead of concave points_mean), you aligned the CSV headers with valid Snowflake column names, which fixed the SQL syntax errors during seeding.