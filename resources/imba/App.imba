import { props } from './props'
import { Home } from './pages/Home'
import { About } from './pages/About'
import { store } from '../../storage/framework/tree'

tag server-link < a
	set current-url value
		self.data-test = value

	set route-to value
		self.href = value.replace('$', '')

	def render
		<self .active=(self.data-test == self.href)>
			<slot>

export tag InnerApp
	css @off o:0	

	get link_component
		$web$ ? 'a' : 'server-link'

	get ssr_url
		this.getAttribute('ssr_url')	

	get is_home
		ssr_url == '/'

	get is_about
		ssr_url == '/about'

	def web_render
		<self[ff:Nunito ta:center] ease>
			<nav[p:7 fs:large]>
				<a[fw:bold] route-to="/$"> "Home"
				" | web {store.test}"
				<a[fw:bold] route-to="/about"> "About"
			<Home route="/$">
			<About route="/about">

	def server_render
		<self[ff:Nunito ta:center]>
			<nav[p:7 fs:large]>
				<{link_component} [fw:bold] current-url=ssr_url route-to="/"> "Home"
				" | server {store.test}"
				<{link_component} [fw:bold] current-url=ssr_url route-to="/about"> "About"
			<About> if is_about
			<Home> if is_home

	def render
		if $web$
			web_render!
		else 
			server_render!
