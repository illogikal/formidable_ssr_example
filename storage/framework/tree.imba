
import { types } from "mobx-state-tree"

const RootStore = types.model({
	test: 'sup'
	current_url: 'sup'
}).actions(do |store| 
	{
		set current_url value
			store.current_url = value
	}
).views(do |store| 
	{

	}
)

const store = RootStore.create {}

export { store }
