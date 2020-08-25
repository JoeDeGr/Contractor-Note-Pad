Notes:
    1) Create Contractor/User Class
        #User?
        Name
        email
        password
        has_many:NotePads

    2) Create Project class
        has_many :phases
        belongs_to :User
        has_many :tasks, through: :phases
        total hours completed
        total materials cost
        completed?
        authorized_user_ids
            authorized_by
            date/time
    
    3) Create Phase class
        has_many :tasks
        belongs_to :project
        Name
        Location
        Items  
        materials cost total 
        hours total
        Completed?
            date_completed
        Date_created
        authorized_user_ids
            authorized_by
            date/time
            

    4) Create Task Class
        belongs_to :phase
        has_many :materials
        Name
        Location
        completed?
            date completed
        date created
        materials list
            materials 
                item description 
                item costs 
            materials cost total 
        hours list
            hours 
                description
                    completed_by
                    hours
                    date
                hours total
        authorized_user_ids
            authorized_by
            date/time 
        
    5) jobs/tasks can be shared with authorized users.