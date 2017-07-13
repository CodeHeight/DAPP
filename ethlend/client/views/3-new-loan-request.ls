Router.route \new_loan_request, path:\new-loan-request template:\newLoanRequest

template \newLoanRequest -> main_blaze do
    loading-component!
    div class:"message #{state.get \message-class }",
        p style:\font-size:20px,
            "This includes " b "#{state.get(\fee-sum)/10^18} ETH"; " platform fees and can take 3-5 minutes"

        p style:\font-size:20px,
            'New ' 
            b 'Loan Request'
            ' will be then available in ’All Loan Requests’ window.'
            br!
            br!
            "Credit Tokens (CRE) are credited to the borrower on successful loan"
            br!
            "repayment (loan amount of 1 ETH = 10 CRE). CRE represents the borrower’s credit rating. "
            br!
            br!
            "Pledge CRE to spare other tokens."
        button class:'new-loan-request card-button bgc-primary',  'New loan request (tokens)'
        button class:'new-domain-request card-button bgc-primary', 'New loan request (domain)'
        button class:'new-rep-request card-button bgc-primary', 'New loan request (reputation)'


Template.newLoanRequest.events do
    'click .new-loan-request':->
        web3.eth.contract(config.LEDGERABI).at(config.ETH_MAIN_ADDRESS).createNewLendingRequest do
            {from:web3.eth.defaultAccount, gas:4000000, gasPrice:15000000000, value:config.BALANCE_FEE_AMOUNT_IN_WEI}
            (err,res)->
                if err => console.log \err: err
                if res 
                    console.log \thash: res
                    state.set \transact-to-address config.ETH_MAIN_ADDRESS
                    state.set \transact-value      state.get(\fee-sum)
                    Router.go \success   

    'click .new-domain-request':->
        web3.eth.contract(config.LEDGERABI).at(config.ETH_MAIN_ADDRESS).createNewLendingRequestEns do
            {from:web3.eth.defaultAccount, gas:4000000, gasPrice:15000000000, value:config.BALANCE_FEE_AMOUNT_IN_WEI}
            (err,res)->
                if err => console.log \err: err
                if res 
                    console.log \thash: res
                    state.set \transact-to-address config.ETH_MAIN_ADDRESS
                    state.set \transact-value      state.get(\fee-sum)
                    Router.go \success   

    'click .new-rep-request':->
        web3.eth.contract(config.LEDGERABI).at(config.ETH_MAIN_ADDRESS).createNewLendingRequestRep do
            {from:web3.eth.defaultAccount, gas:4000000, gasPrice:15000000000, value:config.BALANCE_FEE_AMOUNT_IN_WEI}
            (err,res)->
                if err => console.log \err: err
                if res 
                    console.log \thash: res
                    state.set \transact-to-address config.ETH_MAIN_ADDRESS
                    state.set \transact-value      state.get(\fee-sum)
                    Router.go \success   


Template.newLoanRequest.created =->
    state.set \selected-class \new-loan
    state.set \message-class \hidden
    state.set \loading-class ''
        
Template.newLoanRequest.rendered =~>
    ledger.getFeeSum (err, res)~>
        if err => return err 
        fee-sum = lilNum-toStr res
        state.set \fee-sum fee-sum
        state.set \message-class ''
        state.set \loading-class \hidden
