@Listings = React.createClass
    getInitialState: ->
      listings: @props.data
    getDefaultProps: ->
      listings: []
    render: ->

      React.DOM.div
        className: 'listings'
        React.DOM.h2
          className: 'title'
          'Listings'
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Title'
              React.DOM.th null, 'Description'
              React.DOM.th null, 'Amount'
          React.DOM.tbody null,
            for listing in @state.listings
              React.createElement Listing, key: listing.id, listing: listing
