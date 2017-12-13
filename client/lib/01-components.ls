template \noMetamask -> main_blaze no_metamask!
Router.route \noMetamask, path: \/no_metamask

@no_metamask=-> div style:'padding:100px' class:\container ,
		h1 style:'font-size:50px; display:block', 'No Metamask'
		p style:'font-size:20px; padding-top:15px;padding-bottom:15px', 'This site requires the Metamask plugin for Google Chrome.'
		a class:'btn btn-primary btn-lg' href:'https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn', 'Download Metamask'

@error-component =-> 
	h1 class:"#{state.get \error-class }", 'Wrong address'

@loading-component =-> 
	div class:"loading #{state.get \loading-class } container" style:'padding:100px',  
		h1 style:'font-size:50px; display:block', 'Loading'
		p style:'font-size:20px; padding-top:15px;padding-bottom:15px', 'Please, wait...'

template \loading -> main_blaze do
	div style:'padding:100px' class:\container ,
		h1 style:'font-size:50px; display:block', 'Loading'
		p style:'font-size:20px; padding-top:15px;padding-bottom:15px', 'Please, wait...'

@not-found-component =-> 
	div class:"#{state.get(\not-found-class)} container" style:'padding:100px',  
		h1 style:'font-size:50px; display:block', &0
		p style:'font-size:20px; padding-top:15px;padding-bottom:15px', &1

template \notFound -> 
	div class:"#{state.get(\not-found-class)} container" style:'padding:100px',  
		h1 style:'font-size:50px; display:block', 'Error 404'
		p style:'font-size:20px; padding-top:15px;padding-bottom:15px', 'Not found'

template \reload -> main_blaze do
	div style:'padding:100px' class:\container ,
		h1 style:'font-size:50px; display:block', 'Can not get account address'
		p style:'font-size:20px; padding-top:15px;padding-bottom:15px', 'Please, enter password in the Metamask, or reload page.'
		button class:'btn btn-danger btn-lg' onclick:'location.reload()', 'Reload page'

T \success -> main_blaze do
	div style:'padding:100px' class:\container ,
		h1 style:'font-size:50px; display:block', 'Loading...'
		p style:'font-size:20px; padding-top:15px;padding-bottom:15px', 
			'Please wait. Action will be completed in the next few minutes'
			br!
			if state.get(\thash) => "Transaction hash: #{state.get(\thash)}"
			br!		
			cycle!

		button class:'btn btn-primary btn-lg' onclick:'window.history.back()', 'Go back'


cycle=->
	web3.eth.getTransactionReceipt state.get(\thash), (err, obj)~>
		console.log \getTransactionReceipt: obj

		if (state.get \new_contract) 
			if obj	
				ledger.getLrCount (err, BN)->				
					num = +lilNum-toStr(BN) 
					console.log \num: num
					if num
						ledger.getLr (num - 1), (err, addr)->
							console.log \num: num, \addr: addr
							if (addr != big-zero) && (addr != \0x)
								Router.go "/loan-request/#addr"
							else Meteor.setTimeout (-> cycle!), 200

					else Meteor.setTimeout (-> cycle!), 200
			else Meteor.setTimeout (-> cycle!), 200

		else if (state.get \update_usd)
			console.log \isNeedToUpdateEthToUsdRate ans
			ticker.isNeedToUpdateEthToUsdRate (err,ans)->
				state.set \update_usd true
				if ans == false
					alert 'Rate updated'
					window.history.back! 
				else
					Meteor.setTimeout (-> cycle!), 150000

		else
			if obj
				alert 'Transaction mined'
				window.history.back!
			else Meteor.setTimeout (-> cycle!), 200




contract-details=(cb)-> web3.eth.getTransaction state.get(\thash), (err,res)-> cb(res)



