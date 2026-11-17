# Prepared review

The change forwards na.rm to mean and preserves the default. Missing positions
remain NA after subtraction. Tests use explicit expected values rather than
repeating the implementation. An all-missing vector remains missing. The change
adds no dependency and sends no data to a service. Review this reasoning and run
the tests locally; passing tests alone do not establish that requirements are right.
