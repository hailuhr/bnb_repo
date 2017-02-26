@Listings = React.createClass
    getInitialState: ->
      listings: @props.data

    getDefaultProps: ->
      listings: []

    # addListing: (listing) ->
    # listings = @state.data.listings.slice()
    # listings.push listing
    # @setState listings: listings

    credits: ->
      credits = @state.listings.filter (val) -> val.price >= 0
      credits.reduce ((prev, curr) ->
        prev + parseFloat(curr.price)
      ), 0
    debits: ->
      debits = @state.listings.filter (val) -> val.price < 0
      debits.reduce ((prev, curr) ->
        prev + parseFloat(curr.price)
      ), 0
    balance: ->
      @debits() + @credits()

    deleteRecord: (listing) ->
      records = @state.listings.slice()
      index = listings.indexOf listing
      listings.splice index, 1
      @replaceState listings: listings

    render: ->

      React.DOM.div
        className: 'Listings'
        React.DOM.h2
          className: 'title'
          'Listings'
        React.DOM.div
          className: 'row'

        React.createElement AmountBox, type: 'success', price: @credits(), text: 'Credit'
        React.createElement AmountBox, type: 'danger', price: @debits(), text: 'Debit'
        React.createElement AmountBox, type: 'info', price: @balance(), text: 'Balance'

        React.createElement ListingForm, handleNewListing: @addListing
        React.DOM.hr null

        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Title'
              React.DOM.th null, 'Description'
              React.DOM.th null, 'Amount'
              React.DOM.th null, 'Actions'
          React.DOM.tbody null,
            for listing in @state.listings
              React.createElement Listing, key: listing.id, listing: listing, handleDeleteListing: @deleteListing
