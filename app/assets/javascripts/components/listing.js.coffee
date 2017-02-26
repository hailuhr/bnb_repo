@Listing = React.createClass
    getInitialState: ->
      edit: false

    handleToggle: (e) ->
      e.preventDefault()
      @setState edit: !@state.edit

    handleEdit: (e) ->
      e.preventDefault()
      data =
        title: React.findDOMNode(@refs.title).value
        description: React.findDOMNode(@refs.description).value
        price: React.findDOMNode(@refs.price).value

      $.ajax
        method: 'PUT'
        url: "/listings/#{ @props.listing.id }"
        dataType: 'JSON'
        data:
          listing: data
        success: (data) =>
          @setState edit: false
          @props.handleEditListing @props.listing, data

    handleDelete: (e) ->
      e.preventDefault()
      $.ajax
        method: 'DELETE'
        url: "/listings/#{ @props.listing.id }"
        dataType: 'JSON'
        success: () =>
          @props.handleDeleteListing @props.listing

    listingRow: ->
      React.DOM.tr null,
        React.DOM.td null, @props.listing.title
        React.DOM.td null, @props.listing.description
        React.DOM.td null, amountFormat(@props.listing.price)
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-default'
            onClick: @handleToggle
            'Edit'
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleDelete
            'Delete'

    listingForm: ->
      React.DOM.tr null,
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'text'
            defaultValue: @props.listing.description
            ref: 'description'
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'text'
            defaultValue: @props.listing.title
            ref: 'title'
        React.DOM.td null,
          React.DOM.input
            className: 'form-control'
            type: 'number'
            defaultValue: @props.listing.price
            ref: 'price'
        React.DOM.td null,
          React.DOM.a
            className: 'btn btn-default'
            onClick: @handleEdit
            'Update'
          React.DOM.a
            className: 'btn btn-danger'
            onClick: @handleToggle
            'Cancel'

    render: ->
      if @state.edit
        @listingForm()
      else
        @listingRow()
