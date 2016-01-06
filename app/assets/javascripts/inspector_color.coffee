class Color extends Inspector

  constructor: (options) ->
    options =
      draggableMap: true
      tutorialType:"video"
      tutorialURL: "//player.vimeo.com/video/92555926?autoplay=1&title=0&amp;byline=0&amp;portrait=0"
      jsdataID: '#colorjs'
      tweetString: "_score_ building materials classified! Data mining old maps with Building Inspector from @NYPLMaps @nypl_labs"
      task: 'color'
    super(options)
    @isMultiple = false
    @flags = []

  clearScreen: () =>
    # document.getElementById("multiple-checkbox").checked = false
    @clearFlags()
    @updateMultipleStatus()
    super()

  addEventListeners: () =>
    super()
    $("#multiple-checkbox").on("change", @multipleColorClick)

  addButtonListeners: () =>
    super()
    inspector = @
    $("#residential-button").on("click", @submitresidential)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#mixedresidential-button").on("click", @submitmixedresidential)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#commercial-button").on("click", @submitcommercial)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#institutional-button").on("click", @submitinstitutional)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#lightindustrial-button").on("click", @submitlightindustrial)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#industrial-button").on("click", @submitindustrial)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#specialhazard-button").on("click", @submitspecialhazard)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#openspacerec-button").on("click", @submitopenspacerec)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#nonurban-button").on("click", @submitnonurban)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#waterbody-button").on("click", @submitwaterbody)
    .on("dblclick", (e) ->
      e.preventDefault()
    )

    $("#error-button").on("click", @submiterror)
    .on("dblclick", (e) ->
      e.preventDefault()
    )
    $("#nope-button").on("click", @submitnope)
    .on("dblclick", (e) ->
      e.preventDefault()
    )

    $("#save-button").on("dblclick", (e) ->
      e.preventDefault()
    )

  removeButtonListeners: () =>
    super()
    $(".button, #save-button").unbind()

  activateButton: (button) ->
    $("#residential-button").addClass("inactive") if button != "residential"
    $("#residential-button").addClass("active") if button == "residential"
    $("#mixedresidential-button").addClass("inactive") if button != "mixedresidential"
    $("#mixedresidential-button").addClass("active") if button == "mixedresidential"
    $("#commercial-button").addClass("inactive") if button != "commercial"
    $("#commercial-button").addClass("active") if button == "commercial"
    $("#institutional-button").addClass("inactive") if button != "institutional"
    $("#institutional-button").addClass("active") if button == "institutional"
    $("#lightindustrial-button").addClass("inactive") if button != "lightindustrial"
    $("#lightindustrial-button").addClass("active") if button == "lightindustrial"
    $("#industrial-button").addClass("inactive") if button != "industrial"
    $("#industrial-button").addClass("active") if button == "industrial"
    $("#specialhazard-button").addClass("inactive") if button != "specialhazard"
    $("#specialhazard-button").addClass("active") if button == "specialhazard"
    $("#openspacerec-button").addClass("inactive") if button != "openspacerec"
    $("#openspacerec-button").addClass("active") if button == "openspacerec"
    $("#nonurban-button").addClass("inactive") if button != "nonurban"
    $("#nonurban-button").addClass("active") if button == "nonurban"
    $("#waterbody-button").addClass("inactive") if button != "waterbody"
    $("#waterbody-button").addClass("active") if button == "waterbody"

    $("#save-button").addClass("inactive") if button != "save"
    $("#save-button").addClass("active") if button == "save"

  multipleColorClick: (e) =>
    @isMultiple = false # $("#multiple-checkbox").is(':checked')
    # @multipleClickInterfaceUpdates()
    @intro.nextStep() if @options.tutorialOn

  parseTutorial: (e) =>
    super()
    # console.log @intro.intro._currentStep, e
    if @intro.getCurrentPolygon().multipleactive
      @isMultiple = true
    else
      @isMultiple = false
    # document.getElementById("multiple-checkbox").checked = @isMultiple
    # @multipleClickInterfaceUpdates()
    t = @
    window.setTimeout( () ->
      t.intro.refresh()
    , 200)

  multipleClickInterfaceUpdates: () ->
    @updateMultipleStatus()
    @resetButtons()
    @clearFlags() if !@isMultiple && @flags.length > 0

  resetButtons: () ->
    super()
    $(".button, #save-button").removeClass("active inactive pressed")

  submitresidential: (e) =>
    @activateButton("residential") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "residential")
    else
      @toggleColor("residential")
  submitmixedresidential: (e) =>
    @activateButton("mixedresidential") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "mixedresidential")
    else
      @toggleColor("mixedresidential")
  submitcommercial: (e) =>
    @activateButton("commercial") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "commercial")
    else
      @toggleColor("commercial")
  submitinstitutional: (e) =>
    @activateButton("institutional") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "institutional")
    else
      @toggleColor("institutional")
  submitlightindustrial: (e) =>
    @activateButton("lightindustrial") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "lightindustrial")
    else
      @toggleColor("lightindustrial")
  submitindustrial: (e) =>
    @activateButton("industrial") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "industrial")
    else
      @toggleColor("industrial")
  submitspecialhazard: (e) =>
    @activateButton("specialhazard") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "specialhazard")
    else
      @toggleColor("specialhazard")
  submitopenspacerec: (e) =>
    @activateButton("openspacerec") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "openspacerec")
    else
      @toggleColor("openspacerec")
  submitnonurban: (e) =>
    @activateButton("nonurban") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "nonurban")
    else
      @toggleColor("nonurban")
  submitwaterbody: (e) =>
    @activateButton("waterbody") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "waterbody")
    else
      @toggleColor("waterbody")

  submiterror: (e) =>
    @activateButton("error") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "error")
    else
      @toggleColor("error")
  submitnope: (e) =>
    @activateButton("nope") unless @options.tutorialOn || @isMultiple
    if !@isMultiple
      @submitFlag(e, "nope")
    else
      @toggleColor("nope")

  toggleColor: (color) ->
    if @flags.indexOf(color) == -1
      #not in list, add
      @flags.push(color)
      $("##{color}-button").addClass("pressed")
    else
      @flags.splice(@flags.indexOf(color),1) unless @flags.indexOf(color) == -1
      $("##{color}-button").removeClass("pressed")

  updateMultipleStatus: () ->
    if (@isMultiple)
      $(".secondary").show()
      $("#controls").addClass("multiple")
    else
      $(".secondary").hide()
      $("#controls").removeClass("multiple")

  submitMulticolorFlag: (e) =>
    @activateButton("save") unless @options.tutorialOn
    @flags.sort()
    @submitFlag(e, @flags.join(","))
    @clearFlags()

  clearFlags: () ->
    @flags = []
    @isMultiple = false

$ ->
  new Color()
