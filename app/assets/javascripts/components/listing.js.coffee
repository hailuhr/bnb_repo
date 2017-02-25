
@Listing = React.createClass
    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.listing.title
        React.DOM.td null, @props.listing.description
        React.DOM.td null, amountFormat(@props.listing.price)
