//
//  MainApodWebAPI.swift
//  Zoo
//
//  Created by 劉柏賢 on 2021/9/24.
//

import JSONParser

/**
 https://raw.githubusercontent.com/cmmobile/NasaDataSet/main/apod.json
 */
public struct MainApodWebAPI: HttpGet {
    
    public typealias TParameter = MainApodParameter
    public typealias TResult = MainApodModel
    public typealias TParser = MainApodParser
    
    public let urlString: String = "https://raw.githubusercontent.com/cmmobile/NasaDataSet/main/apod.json"
    
    public init() {
        
    }
}

public struct MainApodParameter: ParameterProtocol
{
    public enum Scope: String {
        case resourceAquire = "resourceAquire"
    }

    public let scope: Scope = Scope.resourceAquire
    public let rid: String = "f18de02f-b6c9-47c0-8cda-50efad621c14"

    public let limit: Int?
    public let offset: Int?

    public init()
    {
        self.limit = nil
        self.offset = nil
    }
    
    public init(limit: Int, offset: Int)
    {
        self.limit = limit
        self.offset = offset
    }
}

public struct MainApodParser: WebAPIJsonParserProtocol
{
    public typealias TResult = MainApodModel
    
    public init()
    {
        
    }
    
    public func parse(_ url: URL, data: Data?, response: HTTPURLResponse?, parameter: TResult.TParameter, error: Error?) throws -> TResult {

//        let json: String = #"""
//        [
//            {
//               "description": "Scroll right and you can cruise along the icy rings of Saturn. This high resolution scan is a mosaic of images presented in natural color. The images were recorded in May 2007 over about 2.5 hours as the Cassini spacecraft passed above the unlit side of the rings. To help track your progress, major rings and gaps are labeled along with the distance from the center of the gas giant in kilometers. The alphabetical designation of Saturn's rings is historically based on their order of discovery; rings A and B are the bright rings separated by the Cassini division. In order of increasing distance from Saturn, the seven main rings run D,C,B,A,F,G,E. (Faint, outer rings G and E are not imaged here.) Four days from now, on November 29, Cassini will make a close flyby of Saturn's moon Titan and use the large moon's gravity to nudge the spacecraft into a series of 20 daring, elliptical, ring-grazing orbits. Diving through the ring plane just 11,000 kilometers outside the F ring (far right) Cassini's first ring-graze will be on December 4.",
//               "copyright": "Cassini Imaging Team, SSI, JPL, ESA, NASA",
//               "title": "Ring Scan",
//               "url": "https://apod.nasa.gov/apod/image/1611/PIA08389_fig1_h500.jpg",
//               "apod_site": "https://apod.nasa.gov/apod/ap161124.html",
//               "date": "2016-11-24",
//               "media_type": "image",
//               "hdurl": "https://apod.nasa.gov/apod/image/1611/PIA08389_fig1.jpg"
//             },
//             {
//               "description": "Do you see the bubble in the center? Seemingly adrift in a cosmic sea of stars and glowing gas, the delicate, floating apparition in this widefield view is cataloged as NGC 7635 - The Bubble Nebula. A mere 10 light-years wide, the tiny Bubble Nebula and the larger complex of interstellar gas and dust clouds are found about 11,000 light-years distant, straddling the boundary between the parental constellations Cepheus and Cassiopeia. Also included in the breathtaking vista is open star cluster M52 (upper left), some 5,000 light-years away. The featured image spans about two degrees on the sky corresponding to a width of about 375 light-years at the estimated distance of the Bubble Nebula.",
//               "copyright": "Sébastien Gozé",
//               "title": "NGC 7635: Bubble in a Cosmic Sea",
//               "url": "https://apod.nasa.gov/apod/image/1611/Bubble_Goze_960.jpg",
//               "apod_site": "https://apod.nasa.gov/apod/ap161123.html",
//               "date": "2016-11-23",
//               "media_type": "image",
//               "hdurl": "https://apod.nasa.gov/apod/image/1611/Bubble_Goze_1600.jpg"
//             },
//             {
//               "description": "Is there an ocean below Sputnik Planum on Pluto? The unusually smooth 1000-km wide golden expanse, visible in the featured image from New Horizons, appears segmented into convection cells. But how was this region created? One hypothesis now holds the answer to be a great impact that stirred up an underground ocean of salt water roughly 100-kilometers thick. The featured image of Sputnik Planum, part of the larger heart-shaped Tombaugh Regio, was taken last July and shows true details in exaggerated colors. Although the robotic New Horizons spacecraft is off on a new adventure, continued computer-modeling of this surprising surface feature on Pluto is likely to lead to more refined speculations about what lies beneath.",
//               "copyright": "NASA, Johns Hopkins U./APL, Southwest Research Inst.",
//               "title": "Pluto's Sputnik Planum",
//               "url": "https://apod.nasa.gov/apod/image/1611/SputnikPlanum_NewHorizons_960.jpg",
//               "apod_site": "https://apod.nasa.gov/apod/ap161122.html",
//               "date": "2016-11-22",
//               "media_type": "image",
//               "hdurl": "https://apod.nasa.gov/apod/image/1611/SputnikPlanum_NewHorizons_1180.jpg"
//             },
//             {
//               "description": "A nova in Sagittarius is bright enough to see with binoculars. Discovered last month by the All-Sky Automated Survey for Supernovae (ASAS-SN), the stellar explosion even approached the limit of naked-eye visibility last week. A classical nova results from a thermonuclear explosion on the surface of a white dwarf star -- a dense star having the size of our Earth but the mass of our Sun. In the featured image, the nova was captured last week above ancient Wat Mahathat in Sukhothai, Thailand. To see Nova Sagittarius 2016 yourself, just go out just after sunset and locate near the western horizon the constellation of the Archer (Sagittarius), popularly identified with an iconic teapot. Also visible near the nova is the very bright planet Venus. Don’t delay, though, because not only is the nova fading, but that part of the sky is setting continually closer to sunset.",
//               "copyright": "Jeff Dai (TWAN)",
//               "title": "Nova over Thailand",
//               "url": "https://apod.nasa.gov/apod/image/1611/NovaSag2016_Dai_960_annotated.jpg",
//               "apod_site": "https://apod.nasa.gov/apod/ap161121.html",
//               "date": "2016-11-21",
//               "media_type": "image",
//               "hdurl": "https://apod.nasa.gov/apod/image/1611/NovaSag2016_Dai_1500_annotated.jpg"
//             },
//             {
//               "description": "How much mass do flocculent spirals hide? The featured true color image of flocculent spiral galaxy NGC 4414 was taken with the Hubble Space Telescope to help answer this question. The featured image was augmented with data from the Sloan Digital Sky Survey (SDSS). Flocculent spirals -- galaxies without well-defined spiral arms -- are a quite common form of galaxy, and NGC 4414 is one of the closest. Stars and gas near the visible edge of spiral galaxies orbit the center so fast that the gravity from a large amount of unseen dark matter must be present to hold them together. Understanding the matter and dark matter distribution of NGC 4414 helps humanity calibrate the rest of the galaxy and, by deduction, flocculent spirals in general. Further, calibrating the distance to NGC 4414 helps humanity calibrate the cosmological distance scale of the entire visible universe.",
//               "copyright": "NASA, ESA, W. Freedman (U. Chicago) et al., & the Hubble Heritage Team (AURA/STScI), SDSS; Processing: Judy Schmidt",
//               "title": "NGC 4414: A Flocculent Spiral Galaxy",
//               "url": "https://apod.nasa.gov/apod/image/1611/ngc4414_HubbleSdss_960.jpg",
//               "apod_site": "https://apod.nasa.gov/apod/ap161120.html",
//               "date": "2016-11-20",
//               "media_type": "image",
//               "hdurl": "https://apod.nasa.gov/apod/image/1611/ngc4414_HubbleSdss_2069.jpg"
//             },
//             {
//               "description": "The recognizable profile of the Pelican Nebula soars nearly 2,000 light-years away in the high flying constellation Cygnus, the Swan. Also known as IC 5070, this interstellar cloud of gas and dust is appropriately found just off the \"east coast\" of the North America Nebula (NGC 7000), another surprisingly familiar looking emission nebula in Cygnus. Both Pelican and North America nebulae are part of the same large and complex star forming region, almost as nearby as the better-known Orion Nebula. From our vantage point, dark dust clouds (upper left) help define the Pelican's eye and long bill, while a bright front of ionized gas suggests the curved shape of the head and neck. This striking synthesized color view utilizes narrowband image data recording the emission of hydrogen and oxygen atoms in the cosmic cloud. The scene spans some 30 light-years at the estimated distance of the Pelican Nebula.",
//               "copyright": "Steve Richards (Chanctonbury Observatory)",
//               "title": "IC 5070: A Dusty Pelican in the Swan",
//               "url": "https://apod.nasa.gov/apod/image/1611/IC5070_Pelican_Nebula_Steve_Richards1024.jpg",
//               "apod_site": "https://apod.nasa.gov/apod/ap161119.html",
//               "date": "2016-11-19",
//               "media_type": "image",
//               "hdurl": "https://apod.nasa.gov/apod/image/1611/IC5070_Pelican_Nebula_Steve_Richards2048.jpg"
//             }
//        ]
//        """#
//
//        var result = TResult.init(jsonString: json)
//        result.result += result.result
//        result.result += result.result
//        result.result += result.result
//        result.result += result.result

        let result = try parseJson(url, data: data, response: response, parameter: parameter, error: error)
        return result
    }
}

public struct MainApodModel: ResponseModelProtocol, JsonDeserializeable, JsonSerializeable, PropertyMapping {

    public typealias TParameter = MainApodParameter
    public var response: HTTPURLResponse?
    public var responseData: Data?
    public var parameter: MainApodParameter?

    public var result: [Result] = []

    public init()
    {

    }

    public init(result: [Result])
    {
        self.result = result
    }

    public mutating func jsonMapping(_ jsonDictionary: JsonDictionary)
    {
        assertionFailure("Not implemented")
    }
    
    public mutating func jsonMapping(_ jsonArray: JsonArray) {
        self.result = [Result](jsonArray: jsonArray)
    }

    public func propertyMapping() -> [(String?, String?)]
    {
        let mapping: [(String?, String?)] = [
            ("result", "result"),
        ]

        return mapping
    }
}

extension MainApodModel {
    public struct Result: JsonDeserializeable, JsonSerializeable, PropertyMapping {

        public var date: String = ""
        public var url: String = ""
        public var apodSite: String = ""
        public var hdurl: String = ""
        public var copyright: String = ""
        public var description: String = ""
        public var mediaType: String = ""
        public var title: String = ""

        public init()
        {
        
        }
        
        public init(date: String, url: String, apodSite: String, hdurl: String, copyright: String, description: String, mediaType: String, title: String)
        {
            self.date = date
            self.url = url
            self.apodSite = apodSite
            self.hdurl = hdurl
            self.copyright = copyright
            self.description = description
            self.mediaType = mediaType
            self.title = title
        }
        
        public mutating func jsonMapping(_ jsonDictionary: JsonDictionary)
        {
            self.date = jsonDictionary["date"].stringOrDefault
            self.url = jsonDictionary["url"].stringOrDefault
            self.apodSite = jsonDictionary["apod_site"].stringOrDefault
            self.hdurl = jsonDictionary["hdurl"].stringOrDefault
            self.copyright = jsonDictionary["copyright"].stringOrDefault
            self.description = jsonDictionary["description"].stringOrDefault
            self.mediaType = jsonDictionary["media_type"].stringOrDefault
            self.title = jsonDictionary["title"].stringOrDefault
        }

        public func propertyMapping() -> [(String?, String?)]
        {
            let mapping: [(String?, String?)] = [
                ("date", "date"),
                ("url", "url"),
                ("apodSite", "apod_site"),
                ("hdurl", "hdurl"),
                ("copyright", "copyright"),
                ("description", "description"),
                ("mediaType", "media_type"),
                ("title", "title"),
            ]

            return mapping
        }
    }
}
