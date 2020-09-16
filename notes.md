Notes:
    1) Create Contractor/User Class
        #User?
        Name
        email
        password
            has_many :projects
            has_many :punch_lists, through: :projects
            has_many :tasks, through: :punch_lists
            has_many :workers

        creates Workers
        

    2) Create Project class
            belongs_to :user
            has_many :punch_lists
            has_many :tasks, through: :punch_lists
            has_many :materials, through: :tasks
        total hours completed
        total materials cost
        completed?
            Wants:
                <!-- authorized_user_ids
                authorized_by
                date/time -->
    
    3) Create PunchList class
            belongs_to :project
            has_many :tasks
            has_many :materials, through: :tasks
        Name
        Location
        Items  
        materials cost total 
        hours total
        Completed?
            date_completed
        Date_created
        Wants: 
            authorized_user_ids
            authorized_by
            date/time
            

    4) Create Task Class
        belongs_to :punch_list
        has_many :materials
        has_many :worker_tasks
        has_many :workers, through: :worker_tasks

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
        
    5) Materials and workers... 
        Materials belog to a Task
        Workers belong to a User and have many tasks. Tasks have many workers. 
    
    6) Jobs/tasks can be shared with authorized users.