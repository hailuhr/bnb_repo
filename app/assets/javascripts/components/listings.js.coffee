@Listings = React.createClass
    getInitialState: ->
      listings: @props.data

    getDefaultProps: ->
      listings: []


    addListing: (listing) ->
      listings = React.addons.update(@state.listings, { $push: [listing] })
      @setState listings: listings

    deleteRecord: (listing) ->
      records = @state.listings.slice()
      index = listings.indexOf listing
      listings.splice index, 1
      @replaceState listings: listings

    updateListing: (listing, data) ->
      index = @state.listings.indexOf listing
      listings = React.addons.update(@state.listings, { $splice: [[index, 1, data]] })
      @replaceState listings: listings

    render: ->

      React.DOM.div
        className: 'Listings'
        React.DOM.h2
          className: 'title'
          'Bnb Listings'
        React.DOM.div
          className: 'row'


        React.createElement ListingForm, handleNewListing: @addListing
        React.DOM.hr null

        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Title'
              React.DOM.th null, 'Description'
              React.DOM.th null, 'Neighborhood'
              React.DOM.th null, 'Address'
              React.DOM.th null, 'Listing Type'
              React.DOM.th null, 'Host'
              React.DOM.th null, 'Amount'
              React.DOM.th null, 'Actions'
          React.DOM.tbody null,
            for listing in @state.listings
              React.createElement Listing, key: listing.id, listing: listing, handleDeleteListing: @deleteListing, handleEditListing: @updateListing
