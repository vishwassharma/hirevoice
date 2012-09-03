express = require "express"

# App
app = express()

# Set up
pub = __dirname + 'public'

app.use app.router
app.use express.static(pub)
app.use express.errorHandler()

# Views
app.set 'views' , __dirname + '/templates'
app.set 'view engine', 'jade'


app.set 'title', 'hirevoice'
app.use express.bodyParser() # to accept post request
app.use express.cookieParser('SecretSauce') # to accept cookie
# app.use express.session()
app.use express.methodOverride() # support put in forms


app.get '/', (req, res) ->
	res.render 'home'

app.get '/about', (req, res) ->
	res.render 'about'
# ==========
# Company
# ==========
app.get '/company', (req, res) ->
	res.send "get all company"

app.get '/company/:company', (req, res) ->
	res.render 'company/show'

app.post "/company", (req, res) ->
	res.send "create new company"

app.put "/company/:company" , (req, res) ->
	res.send "edit the company information"

app.delete '/company/:company', (req, res) ->
	res.send "deleteing company"

# After resource do something else with it
# ==========
# jobs
# ==========
app.get '/jobs', (req, res) ->
	res.send "get all jobs"

app.get '/jobs/:jobid', (req, res) ->
	res.render 'jobs/show'

app.post "/jobs", (req, res) ->
	res.send "create new jobs"

app.put "/jobs/:jobid" , (req, res) ->
	res.send "edit the jobs information"

app.delete '/jobs/:jobs', (req, res) ->
	res.send "deleteing jobs"

# Get all the candidates 
app.get "/jobs/:jobid/candidates", (req, res) ->
	res.send "list of all the candidates who has applied for the job"


# After resource do something else with it
# ==========
# Candidates
# ==========
app.get '/candidates', (req, res) ->
	res.send "get all candidates"

app.get '/candidates/:jobid', (req, res) ->
	res.render 'candidates/show'

app.post "/candidates", (req, res) ->
	res.send "create new candidates"

app.put "/candidates/:jobid" , (req, res) ->
	res.send "edit the candidates information"

app.delete '/candidates/:candidates', (req, res) ->
	res.send "deleteing candidates"

# ================================================

app.listen(3000)