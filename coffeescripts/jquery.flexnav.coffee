###
	FlexNav.js 0.4

	Copyright 2013, Jason Weaver http://jasonweaver.name
	Released under the WTFPL license
	http://sam.zoy.org/wtfpl/

//
###

$.fn.flexNav = (options) ->
	settings = $.extend
		'breakpoint': '800'
		'animationSpeed': 'fast'
		
		$this = $(@)
		
		resizer = ->
			if $(window).width() < settings.breakpoint
				$("body").removeClass("lg-screen").addClass("sm-screen")
			else 
				$("body").removeClass("sm-screen").addClass("lg-screen")
								
			$('.lg-screen #nav, .lg-screen #nav ul').fadeIn()
			$('.sm-screen #nav, .sm-screen #nav ul').hide()

		# Set class on html element for touch/no-touch
		is_touch_device = ->
			!!('ontouchstart' in window)

		if is_touch_device()
			$('html').addClass('flexNav-touch')
		else
			$('html').addClass('flexNav-no-touch')
		
		# Set some classes in the markup
		$(@).find("li").each ->
			if $(@).has("ul").length
				$(@).addClass("item-with-ul")
		
		# Toggle for nav menu
		$('.menu-button').click ->
			$this.slideToggle(settings.animationSpeed)
					
		$('.menu-button, .item-with-ul').append('<span class="touch-button"><i class="navicon">&#9660;</i></span>')
			
		# Toggle click for sub-menus on touch and or small screens
		$('.touch-button').click ->		
			$(@).parent('.item-with-ul').find('>.sub-menu').slideToggle(settings.animationSpeed)
				
	# Call once to set		
	resizer()
	
	# Call on browser resize	
	$(window).on('resize', resizer);