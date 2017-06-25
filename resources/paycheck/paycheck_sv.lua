-- Loading MySQL Class
require "resources/essentialmode/lib/MySQL"
MySQL:open(database.host, database.name, database.username, database.password)

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local salary = 50
	TriggerEvent('es:getPlayerFromId', source, function(user)
  	-- Add money to the user
  	local user_id = user.identifier
  	-- Query that retrieves the user's money
  	local executed_query = MySQL:executeQuery("SELECT salary FROM users INNER JOIN jobs ON users.job = jobs.job_id WHERE identifier = '@username'",{['@username'] = user_id})
    local result = MySQL:getResults(executed_query, {'salary'})
    local salary_job = result[1].salary
  	user:addMoney((salary + salary_job))
 	TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Pay received:  + "..salary.."~g~$~s~~n~Salary Received: + "..salary_job.." ~g~$")
 	end)
end)
