do
    Creep = { }

    Creep.wolves        = { }
    Creep.lobstrokks    = { }
    Creep.trolls        = { }
    Creep.ogres         = { }
    Creep.gnolls        = { }
    Creep.centaurs      = { }
    Creep.turtles       = { }
    Creep.dragonspawn   = { }
    Creep.bluedragons   = { }
    Creep.blackdragons  = { }
    Creep.bronzedragons = { }
    Creep.reddragons    = { }
    Creep.greendragons  = { }
    Creep.kamok         = { }

    function Creep.lobstrokks:initialize()
        self.round        = 1
        self.name         = 'Lobstrokks'
        self.stylizedName = 'L O B S T R O K K S'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 215
        self.limit        = 100
        self.spawnCamp    = { SpawnCircle.getWaterCamp() }
        self.startSound   = CreateSound('Units\\Creeps\\Lobstrokkblue\\LobstrokkWhat1.wav', false, false, false, 10, 10, 'DefaultEAXON')
        self.endSound     = CreateSound('Units\\Creeps\\Lobstrokkblue\\LobstrokkDeath1.wav', false, false, false, 10, 10, 'DefaultEAXON')
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('nlpr'), 60.0)
        UnitPoolAddUnitType(self.pool, FourCC('nlpd'), 50.0)
        UnitPoolAddUnitType(self.pool, FourCC('nltc'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('nlds'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('nlsn'), 20.0)
        UnitPoolAddUnitType(self.pool, FourCC('nlkl'), 10.0)
    end

    function Creep.wolves:initialize()
        self.round        = 1
        self.name         = 'Волки'
        self.stylizedName = 'В О Л К И'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 215
        self.limit        = 100
        self.spawnCamp    = { SpawnCircle.getGroundCamp() }
        self.startSound   = CreateSound('Units\\Orc\\Spiritwolf\\SpiritWolfYes3.wav', false, false, false, 10, 10, 'DefaultEAXON')
        self.endSound     = CreateSound('Units\\Creeps\\Direwolf\\DireWolfDeath1.wav', false, false, false, 10, 10, 'DefaultEAXON')
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('n002'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('n003'), 20.0)
        UnitPoolAddUnitType(self.pool, FourCC('n004'), 10.0)

        Preload.unit(FourCC('n002'))
        Preload.unit(FourCC('n003'))
        Preload.unit(FourCC('n004'))
    end

    function Creep.trolls:initialize()
        self.round        = 2
        self.name         = 'Тролли'
        self.stylizedName = 'Т Р О Л Л И'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 250
        self.spawnCamp    = { SpawnCircle.getGroundCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('nftr'), 60.0)
        UnitPoolAddUnitType(self.pool, FourCC('nftb'), 50.0)
        UnitPoolAddUnitType(self.pool, FourCC('nfsp'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('nftt'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('nftk'), 20.0)
        UnitPoolAddUnitType(self.pool, FourCC('nfsh'), 10.0)
    end

    function Creep.ogres:initialize()
        self.round        = 2
        self.name         = 'Огры'
        self.stylizedName = 'О Г Р Ы'
        self.tip          = 'Огры спокойно могут надавать пиздю*ей неосторожному игроку, так что будьте керифул.'
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 250
        self.spawnCamp    = { SpawnCircle.getGroundCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('nogr'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('nomg'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('nogm'), 20.0)
        UnitPoolAddUnitType(self.pool, FourCC('nogl'), 10.0)
    end

    function Creep.gnolls:initialize()
        self.round        = 2
        self.name         = 'Гноллы'
        self.stylizedName = 'Г Н О Л Л Ы'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 250
        self.spawnCamp    = { SpawnCircle.getGroundCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('ngna'), 60.0)
        UnitPoolAddUnitType(self.pool, FourCC('ngns'), 50.0)
        UnitPoolAddUnitType(self.pool, FourCC('ngno'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('ngnb'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('ngnw'), 20.0)
        UnitPoolAddUnitType(self.pool, FourCC('ngnv'), 10.0)
    end

    function Creep.centaurs:initialize()
        self.round        = 3
        self.name         = 'Кентавры'
        self.stylizedName = 'К Е Н Т А В Р Ы'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 250
        self.spawnCamp    = { SpawnCircle.getGroundCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('ncea'), 60.0)
        UnitPoolAddUnitType(self.pool, FourCC('ncer'), 50.0)
        UnitPoolAddUnitType(self.pool, FourCC('ncim'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('ncen'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('ncks'), 20.0)
        UnitPoolAddUnitType(self.pool, FourCC('ncnk'), 10.0)
    end

    function Creep.turtles:initialize()
        self.round        = 4
        self.name         = 'Черепахи'
        self.stylizedName = 'Ч Е Р Е П А Х И'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 250
        self.spawnCamp    = { SpawnCircle.getWaterCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('ntrh'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('ntrs'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('ntrt'), 20.0)
        UnitPoolAddUnitType(self.pool, FourCC('ntrg'), 20.0)
        UnitPoolAddUnitType(self.pool, FourCC('ntrd'), 20.0)
    end

    function Creep.dragonspawn:initialize()
        self.round        = 13
        self.name         = 'Дракониды'
        self.stylizedName = 'Д Р А К О Н И Д Ы'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 120
        self.spawnCamp    = { SpawnCircle.getGroundCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('nbdm'), 50.0)
        UnitPoolAddUnitType(self.pool, FourCC('nbda'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('nbdw'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('nbds'), 20.0)
        UnitPoolAddUnitType(self.pool, FourCC('nbdo'), 10.0)
    end

    function Creep.reddragons:initialize()
        self.round        = 14
        self.name         = 'Red Dragons'
        self.stylizedName = 'R E D   D R A G O N S'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 120
        self.spawnCamp    = { SpawnCircle.getAirCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('nrdk'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('nrdr'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('nrwm'), 20.0)
    end

    function Creep.blackdragons:initialize()
        self.round        = 14
        self.name         = 'Black Dragons'
        self.stylizedName = 'B L A C K   D R A G O N S'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 120
        self.spawnCamp    = { SpawnCircle.getAirCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('nbdr'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('nbdd'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('nbwm'), 20.0)
    end

    function Creep.bronzedragons:initialize()
        self.round        = 14
        self.name         = 'Bronze Dragons'
        self.stylizedName = 'B R O N Z E   D R A G O N S'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 120
        self.spawnCamp    = { SpawnCircle.getAirCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('nbzw'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('nbzk'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('nbzd'), 20.0)
    end

    function Creep.greendragons:initialize()
        self.round        = 14
        self.name         = 'Green Dragons'
        self.stylizedName = 'G R E E N   D R A G O N S'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 120
        self.spawnCamp    = { SpawnCircle.getAirCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('ngrw'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('ngdk'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('ngrd'), 20.0)
    end

    function Creep.bluedragons:initialize()
        self.round        = 14
        self.name         = 'Blue Dragons'
        self.stylizedName = 'B L U E   D R A G O N S'
        self.tip          = ''
        self.prepare      = 15.0
        self.count        = 300
        self.limit        = 120
        self.spawnCamp    = { SpawnCircle.getAirCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('nadw'), 40.0)
        UnitPoolAddUnitType(self.pool, FourCC('nadk'), 30.0)
        UnitPoolAddUnitType(self.pool, FourCC('nadr'), 20.0)
    end

    function Creep.kamok:initialize()
        self.round        = 20
        self.name         = 'Ka\'mok'
        self.stylizedName = 'K A \' M O K'
        self.tip          = ''
        self.prepare      = 45.0
        self.count        = 1
        self.limit        = 1
        self.spawnCamp    = { SpawnCircle.getGroundCamp() }
        self.pool         = CreateUnitPool()

        UnitPoolAddUnitType(self.pool, FourCC('n00D'), 100.0)
    end

end
