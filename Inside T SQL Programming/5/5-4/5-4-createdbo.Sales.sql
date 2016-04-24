SET NOCOUNT ON;
USE tempdb;
GO
IF OBJECT_ID('dbo.Sales') IS NOT NULL
  DROP TABLE dbo.Sales;
GO

CREATE TABLE dbo.Sales
(
  mnth DATETIME NOT NULL PRIMARY KEY,
  qty  INT      NOT NULL
);

INSERT INTO dbo.Sales(mnth, qty) VALUES('20041201', 100);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20050101', 110);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20050201', 120);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20050301', 130);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20050401', 140);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20050501', 140);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20050601', 130);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20050701', 120);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20050801', 110);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20050901', 100);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20051001', 110);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20051101', 100);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20051201', 120);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20060101', 130);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20060201', 140);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20060301', 100);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20060401', 100);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20060501', 100);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20060601', 110);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20060701', 120);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20060801', 110);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20060901', 120);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20061001', 130);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20061101', 140);
INSERT INTO dbo.Sales(mnth, qty) VALUES('20061201', 100);
GO