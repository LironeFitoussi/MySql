-- ===================================================
-- 🕓 DEFAULT & ON UPDATE with TIMESTAMP/DATETIME (MySQL)
-- ===================================================

-- Drop the table if it exists
DROP TABLE IF EXISTS audit_logs;

-- Create a table with:
-- - DEFAULT CURRENT_TIMESTAMP (auto-set on INSERT)
-- - ON UPDATE CURRENT_TIMESTAMP (auto-updated on UPDATE)
CREATE TABLE audit_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action VARCHAR(100),

    -- Automatically set when row is created
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Automatically updated whenever row is updated
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =======================================
-- ✅ Insert new rows
-- =======================================
INSERT INTO audit_logs (action) VALUES 
('User Created'),
('User Logged In'),
('Password Changed');

-- Check results
SELECT * FROM audit_logs;

-- =======================================
-- 🛠️ Simulate an update (update action)
-- =======================================
-- Wait a few seconds then run:
UPDATE audit_logs 
SET action = 'User Updated Info'
WHERE id = 1;

-- Re-check the table to see updated timestamp
SELECT * FROM audit_logs;

-- =======================================
-- ✅ You can also use DATETIME if needed
-- But DATETIME does NOT support ON UPDATE directly
-- You’d need to update it manually via a trigger
-- =======================================

-- Example:
DROP TABLE IF EXISTS log_manual;

CREATE TABLE log_manual (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(100),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME
);

-- Manual update with NOW()
UPDATE log_manual
SET updated_at = NOW()
WHERE id = 1;

-- =======================================
-- 📌 Summary
-- =======================================
-- TIMESTAMP DEFAULT CURRENT_TIMESTAMP
--    → sets value at INSERT
-- TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
--    → auto-updates value on row modification
-- DATETIME does not support ON UPDATE directly
--    → use triggers or manual updates

-- ✅ Use Cases:
-- - Track created/updated timestamps
-- - Log audit history
-- - Record last login or activity time
