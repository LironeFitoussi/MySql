# 🧱 Section 12: Constraints & ALTER TABLE

In this section, we explore how SQL constraints help maintain data integrity and how to modify your tables over time using `ALTER TABLE`. You’ll learn to enforce rules and evolve your schema confidently.

---

We begin with the **UNIQUE** constraint, which ensures that a column (or combination of columns) only contains distinct values — a key feature in preventing duplicate data.

The **CHECK** constraint follows, allowing you to define custom rules for column values, like ensuring that a price is always positive or a quantity is under a certain limit.

Next, you'll discover how to create **Named Constraints** so you can easily reference and manage them later — especially useful when debugging or modifying database rules.

We also cover **Multiple Column Constraints**, where you enforce rules that involve more than one column — like making sure a combination of `email` and `organization_id` is unique.

Then we shift into structural changes using `ALTER TABLE`, starting with how to **add new columns** to an existing table safely.

You’ll learn how to **drop columns** when they’re no longer needed — a simple but irreversible operation that must be used with care.

Renaming a column or even a table is next, and you’ll see how to do it smoothly without breaking your queries.

We then cover how to **modify column types or constraints**, such as changing a column from `INT` to `VARCHAR` or making it `NOT NULL`.

Lastly, we revis it constraints within `ALTER TABLE`, showing how to **add or remove constraints dynamically** as your database evolves.