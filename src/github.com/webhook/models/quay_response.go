package models

type Response struct {

	Name             string
	Repository       string
	Namespace        string
	DockerUrl        string `json:"docker_url"`
	Visibility       string
	Homepage         string
	PushedImageCount int
	PrunedImageCount int
	UpdatedTags      []string `json:"updated_tags"`
}

/*
{

"name": "pgpool",
"repository": "akrmhrjn/pgpool",
"namespace": "akrmhrjn",
"docker_url": "quay.io/akrmhrjn/pgpool",
"visibility": "public",
"pruned_image_count": 3,
"homepage": "https://quay.io/repository/akrmhrjn/pgpool",
"updated_tags": {
"foo": "anotherimage",
"latest": "someimageid"
}
*/