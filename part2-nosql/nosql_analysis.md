Section A: Limitations of RDBMS 

Relational databases like MySQL are well suited for structured and consistent data, but they struggle when dealing with highly diverse product catalogs. In FlexiMart’s case, different product types have different attributes. For example, laptops require specifications such as RAM, processor, and storage, while shoes need size, color, and material. Representing this diversity in an RDBMS would require multiple nullable columns or separate tables, leading to sparse data and complex joins.

Frequent schema changes are another limitation. Adding new product types or attributes requires altering table schemas, which can be time-consuming, risky in production environments, and may cause downtime. This rigid structure reduces agility as the catalog evolves.

Additionally, storing customer reviews as nested data is inefficient in RDBMS. Reviews would need separate tables and joins to retrieve product details along with reviews, increasing query complexity and reducing performance for read-heavy operations.

Section B: NoSQL Benefits 

MongoDB addresses these challenges through its flexible, document-oriented schema. Each product can be stored as a JSON-like document with only the attributes relevant to that product. This allows laptops, shoes, and other product types to coexist in the same collection without enforcing a fixed structure, eliminating unnecessary null fields.

MongoDB also supports embedded documents, making it ideal for storing customer reviews directly within the product document. Reviews, ratings, and comments can be nested inside a product, enabling faster reads and simpler queries without costly joins.

Horizontal scalability is another major advantage. MongoDB supports sharding, allowing data to be distributed across multiple servers. This ensures that as FlexiMart’s product catalog and user base grow, the system can scale efficiently while maintaining performance. Together, these features make MongoDB well suited for a dynamic and evolving product catalog.

Section C: Trade-offs

Despite its advantages, MongoDB has some drawbacks compared to MySQL. First, MongoDB provides weaker support for complex multi-table transactions. While it supports transactions, they are generally less efficient than those in relational databases, making MongoDB less ideal for highly transactional systems like financial records.

Second, data consistency enforcement is weaker. Since MongoDB uses a flexible schema, enforcing strict data validation requires additional application-level checks. This increases the risk of inconsistent or malformed data if not carefully managed, whereas MySQL enforces structure and constraints at the database level.