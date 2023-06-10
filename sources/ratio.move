/// Defines the Ratio struct
module suiswap::ratio {

    /// Invalid ratio numerator or denominator configuration
    const ERatioInvalidInitialization: u64 = 174001;

    struct Ratio has copy, store, drop {
        num: u64,
        den: u64,
    }

    public fun ratio(num: u64, den: u64): Ratio {
        assert!(den != 0, ERatioInvalidInitialization);
        Ratio { num: num, den: den }
    }

    public fun num(r: &Ratio): u64 { r.num }
    public fun den(r: &Ratio): u64 { r.den }
    public fun partial(r: Ratio, value: u64): u64 {
        let v = (value as u128) * (r.num as u128) / (r.den as u128);
        (v as u64)
    }

    #[test] #[expected_failure(abort_code = ERatioInvalidInitialization)] fun t_ratio_init_1() { ratio(3, 0); }
    #[test] #[expected_failure(abort_code = ERatioInvalidInitialization)] fun t_ratio_init_2() { ratio(0, 0); }

    #[test] fun t_ratio_common_1() {
        assert!(num(&ratio(2, 3)) == 2, 0);
        assert!(den(&ratio(2, 3)) == 3, 0);
        assert!(num(&ratio(1999, 3)) == 1999, 0);
        assert!(den(&ratio(1999, 4)) == 4, 0);
    }

    #[test] fun t_ratio_partial_1() {
        assert!(partial(ratio(1149362072123057713, 10609185859226967187), 17830979652147756727) == 1931745941009457204, 0);
        assert!(partial(ratio(1816268242648592785, 14142814568268105092), 17384953505635354156) == 2232634727676734710, 0);
        assert!(partial(ratio(16599285194205763572, 9608290926832096055), 1022454880997506549) == 1766393242786736735, 0);
        assert!(partial(ratio(17050167223097589859, 11143493648903624019), 8554502702855225454) == 13088866578972046634, 0);
        assert!(partial(ratio(9602441293447641696, 6587594295434144404), 2843815503889875253) == 4145302549130204252, 0);
        assert!(partial(ratio(1063699487857360398, 2215699638335914762), 7976244743790704033) == 3829186638026094385, 0);
        assert!(partial(ratio(5803934207515640480, 1831064968840293092), 2548144117335815006) == 8076862951319459972, 0);
        assert!(partial(ratio(11016092742941375617, 10422804317858800908), 16426475731781788972) == 17361506038344047978, 0);
        assert!(partial(ratio(14859392876292988253, 16055773893828706106), 3300977019493642083) == 3055007795489947497, 0);
        assert!(partial(ratio(14825186077586787171, 8279953131874035162), 2316176743467208362) == 4147094876454760716, 0);
        assert!(partial(ratio(785369640684490226, 17909773241340422269), 6075182459486928972) == 266405598831739927, 0);
        assert!(partial(ratio(6561212078187382152, 2891662446256101522), 6394551417298535581) == 14509303479764989100, 0);
        assert!(partial(ratio(16642843481889077696, 1088573667390441052), 525471116350580632) == 8033754449196620601, 0);
        assert!(partial(ratio(18444517429994963758, 16278493306012487128), 15934758163247802490) == 18055044724331022892, 0);
        assert!(partial(ratio(2587386067416790215, 6140532904577094004), 18279713930842070201) == 7702373373127093404, 0);
        assert!(partial(ratio(14104626449397159760, 6796977713759373663), 3454091490401646097) == 7167696032831431137, 0);
        assert!(partial(ratio(6570210913774069744, 17361103117915220946), 863509709443154848) == 326790347283795037, 0);
        assert!(partial(ratio(1716480556774501371, 9416080073698638128), 16290577526578467887) == 2969649723041907849, 0);
        assert!(partial(ratio(1401484538853254214, 11172746370833003770), 8910655444163082052) == 1117732867242386033, 0);
        assert!(partial(ratio(1321572571604375217, 6970780088645756756), 1185651314706224455) == 224784634872454641, 0);
        assert!(partial(ratio(14882721070287884371, 13040133500235785148), 3389031766513138288) == 3867906297005936177, 0);
        assert!(partial(ratio(4419461704665911417, 4634342682862740273), 6445689378307094040) == 6146821527233992776, 0);
        assert!(partial(ratio(11770049515471272857, 11304418676773954429), 1923992428563746160) == 2003241988737953218, 0);
        assert!(partial(ratio(657244010676560061, 16164768130513587006), 16707878982460324726) == 679326378434228361, 0);
        assert!(partial(ratio(7405255397855266557, 9987734168080403459), 105435073053682095) == 78173250380381799, 0);
        assert!(partial(ratio(16973403709779295416, 17888303883682278250), 174853035337530542) == 165910148774445115, 0);
        assert!(partial(ratio(6538738285789146026, 7796114248550827207), 134054124454890118) == 112433554460039974, 0);
        assert!(partial(ratio(7731778695327577383, 10970819219787685002), 17821416715519582755) == 12559795884073980018, 0);
        assert!(partial(ratio(18391404736405524332, 17691455307419696966), 5590085873716336495) == 5811253513534440816, 0);
        assert!(partial(ratio(10203156454093148334, 11938250799844924213), 3831187281159122001) == 3274366059984771961, 0);
        assert!(partial(ratio(5916161371055601205, 7956171768591306605), 17782407158851286769) == 13222890779318300927, 0);
        assert!(partial(ratio(11515297771477683078, 11309384981379046244), 7812102076281739509) == 7954338965176326911, 0);
        assert!(partial(ratio(12096935963557440877, 3228485039409557435), 3979292129123338263) == 14910164203547545627, 0);
        assert!(partial(ratio(7655116222865349030, 13932510834661518919), 16341870332620485858) == 8978921185116324630, 0);
        assert!(partial(ratio(3301521227116563951, 11280393171052177676), 2670183980686475094) == 781503708147853679, 0);
        assert!(partial(ratio(8751138525638685863, 12928104420852794239), 16551769839855853336) == 11204026978574813392, 0);
        assert!(partial(ratio(1200349326849638146, 11798618697078148380), 7726212552089582850) == 786037270472571492, 0);
        assert!(partial(ratio(14573420724906291948, 3028329818287541973), 1587903877924786402) == 7641569007431964246, 0);
        assert!(partial(ratio(11872251745356067129, 13063342414437843646), 13237426164533306923) == 12030462870835313988, 0);
        assert!(partial(ratio(13384131031544766884, 8862928048637602169), 4577066570355715410) == 6911943590375973612, 0);
        assert!(partial(ratio(108729518279717563, 1953303619811412279), 147567712020631702) == 8214271493129410, 0);
        assert!(partial(ratio(3659517019571320578, 6686857776650933745), 8570675680957681074) == 4690474146647599282, 0);
        assert!(partial(ratio(3071823083612381998, 10764699905361043454), 2422215845724358140) == 691205385547458639, 0);
    }
}