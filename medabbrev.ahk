; Medical abbreviations hotstrings/hotkeys
; Based on Wikipedia (https://en.wikipedia.org/wiki/List_of_abbreviations_used_in_medical_prescriptions) and Pocket Medicine 6th Edition
; Current as of May 2 2018

; Set hotstrings to be case-sensitive
#Hotstring c

;; Deprecated by Joint Commission
;; https://www.jointcommission.org/facts_about_do_not_use_list/
::U::units
::IU::international units  ; may be mistaken for "IV" or "10"
::qd::daily  ; quaque die; may be mistaken for "qod"
::q.d.::daily
::QD::daily
::Q.D.::daily
::qod::every other day  ; quaque altera die; may be mistaken for "qd"
::q.o.d::every other day
::QOD::every other day
::Q.O.D.::every other day
; Rule regarding leading and trailing zeros not defined here due to context sensitivity (allowed for non-prescription values)
::MgSO4::magnesium sulfate  ; may be mistaken for morphine sulfate (MSO4)
::MSO4::morphine sulfate  ; may be mistaken for magnesium sulfate (MgSO4)

;; Deprecated by Institute for Safe Medication Practices and American Medical Association
::a.d.::right ear  ; auris dextra; "a" may be mistaken for "o"
::AD::right ear
::a.s.::left ear  ; auris sinistra; "a" may be mistaken for "o"
::AS::left ear
::a.u.::both ears  ; auris utraque; "a" may be mistaken for "o"
::AU::both ears
::b.i.d.::twice a day  ; bis in die; deprecated by AMA Manual of Style
::BID::twice a day
::B.I.D.::twice a day
::b.d.::twice a day
::b.t.::bedtime  ; may be mistaken for b.i.d.
::c.c.::mL  ; may be confused with "with food" ("cum cibo")
::d.::day  ; may be confused with "dose"
::dc::discontinue  ; may be confused with "discharge"
::d/c::discontinue
::DC::discontinue
::D/C::discontinue
::DTO::deodorized tincture of opium  ; may be confused with "diluted tincture of opium"
::hs::at bedtime  ; hora somni; may be confused with "half-strength"
::h.s.::at bedtime
::HS::at bedtime
::H.S.::at bedtime
::IJ::injection  ; may be mistaken for "IV"
::IN::intranasal  ; may be mistaken for "IM" or "IV"
;::IT::intrathecal  ; may be mistaken for other abbreviations; commented out here due to potential confusion with "information technology"
::npo::nothing by mouth  ; nil per os; deprecated by AMA Manual of Style
::n.p.o.::nothing by mouth
::NPO::nothing by mouth
::N.P.O.::nothing by mouth
::o.d.::right eye  ; oculus dexter; "o" may be mistaken for "a"
::OD::right eye  ; oculus dexter
::o.s.::left eye  ; oculus sinister; "o" may be mistaken for "a"
::OS::left eye  ; oculus sinister
::o.u.::both eyes  ; oculus uterque; "o" may be mistaken for "a"
::OU::both eyes  ; oculus uterque;
::p.o.::by mouth  ; per os; deprecated by AMA Manual of Style
::PO::by mouth
::q.h.s.::every night at bedtime  ; quaque hora somni; may be mistaken for "q.h.r" (every hour)
::q.i.d.::4 times a day  ; quater in die; may be mistaken for "qd" or "qod"; deprecated by AMA Manual of Style
::QID::4 times a day
::q.n.::every night  ; may be mistaken for "qh" (every hour)
::QN::every night
::SC::subcutaneous  ; may be mistaken for "SL" (sublingual)
::s.s.::sliding scale  ; may be mistaken for "55"
::SS::sliding scale
::SSI::sliding scale regular insulin  ; may be confused with "strong solution of iodine" or "SSRI"
::SQ::subcutaneously
::tid::3 times a day  ; ter in die; deprecated by AMA Manual of Style
::t.i.d.::3 times a day
::TID::3 times a day
::T.I.D.::3 times a day
::td::3 times a day  ; ter in die; deprecated by AMA Manual of Style
::t.d.::3 times a day
::TD::3 times a day
::T.D.::3 times a day
::tiw::3 times a week  ; may be mistaken for "twice a week"
::t.i.w.::3 times a week
::TIW::3 times a week
::T.I.W.::3 times a week
::μg::microgram  ; may be mistaken for "milligram" ("mg")
::@::at  ; may be mistaken for "2"
::>::greater than  ; may be mistaken for "7"
::<::less than  ; may be mistaken for "L"

;; Abbreviations observed at NCKUH
::AAD::discharge against medical advice
::AMA::against medical advice
::a/w::associated with
::BM::bone marrow
::BS::blood sugar
::BSA::body surface area
::CD::change dressings
::c.m.::tomorrow morning  ; cras mane
::gtt::drops  ; gutta/guttae
::IBW::ideal body weight
::MBD::discharge  ; "may be discharged"
::mcg::microgram  ; may be mistaken for "milligram" ("mg")
::OPD::outpatient clinic
::SOB::shortness of breath
::ug::microgram  ; may be mistaken for "milligram" ("mg")
;:?:WM:: with meal  ; commented out here due to potential confusion with "Waldenstrom's macroglobulinemia"
::w/o::without
::w/u::workup
::y/o::{bs 1}-year-old

;; Common drug abbreviations
::5-ASA::mesalazine
::6-MP::6-mercaptopurine
::abx::antibiotics
::ACV::acyclovir  ; as defined in Pocket Medicine
::AMB::amphotericin B  ; as defined in NCKUH Formulary 12e
::ASA::aspirin  ; acetylsalicylic acid
::AZA::azathioprine
::BDZ::benzodiazepine  ; as defined in Pocket Medicine
::BZD::benzodiazepine
::Cftx::ceftriaxone  ; as defined in Pocket Medicine
::CsA::cyclosporine A
::CTX::ceftriaxone
::DA::dopamine
::HCQ::hydroxychloroquine
::INH::isoniazid  ; isonicotinylhydrazide
::MTX::methotrexate
::PZA::pyrazinamide
::SSZ::sulfasalazine

;; Common medical condition abbreviations
::AAA::abdominal aortic aneurysm
;::CD::Crohn's disease  ; commented out here due to potential confusion with "change dressings"
::hx::history
::HF::heart failure
::PNA::pneumonia
::UC::ulcerative colitis