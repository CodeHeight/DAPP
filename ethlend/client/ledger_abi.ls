config.LEDGER-ABI = [{"constant":true,"inputs":[],"name":"mainAddress","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"index","type":"uint256"}],"name":"getLr","outputs":[{"name":"out","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"index","type":"uint256"}],"name":"getLrFunded","outputs":[{"name":"out","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"a","type":"address"},{"name":"index","type":"uint256"}],"name":"getLrForUser","outputs":[{"name":"out","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"totalLrCount","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getLrCount","outputs":[{"name":"out","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"whereToSendFee","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"createNewLendingRequest","outputs":[{"name":"out","type":"address"}],"payable":true,"type":"function"},{"constant":true,"inputs":[{"name":"a","type":"address"}],"name":"getLrCountForUser","outputs":[{"name":"out","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"borrowerFeeAmount","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getLrFundedCount","outputs":[{"name":"out","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"getFeeSum","outputs":[{"name":"out","type":"uint256"}],"payable":false,"type":"function"},{"inputs":[{"name":"whereToSendFee_","type":"address"}],"payable":false,"type":"constructor"},{"payable":true,"type":"fallback"}]