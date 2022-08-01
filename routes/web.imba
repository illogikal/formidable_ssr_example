import { App } from '../resources/views/app'
import { Request } from '@formidablejs/framework'
import { Route } from '@formidablejs/framework'
import { view } from '@formidablejs/framework'

# --------------------------------------------------------------------------
# Web Routes
# --------------------------------------------------------------------------
#
# Here is where you can register web routes for your application. These
# routes are loaded by the RouteServiceResolver within a group which
# is assigned the "session" middleware group.

Route.get '/*', do 
	# FOR SSR
	url = await $1.url()
	view(App, { url })
