@Listing = React.createClass
    handleDelete: (e) ->
      e.preventDefault()
      $.ajax
        method: 'DELETE'
        url: "/listings/#{ @props.listing.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteListing @props.listing

    render: ->
      React.DOM.tr null,
        React.DOM.td null, @props.listing.title
        React.DOM.td null, @props.listing.description
        React.DOM.td null, amountFormat(@props.listing.price)
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleDelete
            'Delete'
