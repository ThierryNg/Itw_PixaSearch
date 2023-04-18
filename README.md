# Itw_PixaSearch

Quick interview assignment using
- Clean Swift architecture (my take on this implementation is documented here : https://smart-peridot-702.notion.site/CleanSwift-7966745431bc4132abb35c7820d34993)
- A `NetworkClient` to execute generic requests returning their own `Codable` responses

## Next steps, given more time :

### Global
- Config singleton
- Helper to better log errors

### SearchResults scene 

- Additional views to add in the main scene (emptyView state and "no results" view)
- Add API credits
- loading images from the URLs

- Tending to the UI (collectionView layout, conditioning content mode to horizontal/vertical pictures)

- Extract the searchBar from the titleView to transition to a submission flow (type, then submit) ? 

### ImageViewer scene

- Do it (Since it's multi-select, envisioning a carousel-type of UI)
