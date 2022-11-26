import{Instrument}from "../../../entities/Instrument";
import{InstrumentToModel}from "../helpers/InstrumentToModel";
import{InstrumentRepository}from "../repositories/InstrumentRepository";

export class CreateInstrumentUseCase{
    async execute(data:Instrument){
        try {
            const {instrumentOption,instrumentImageLink,instrumentHoverImageLink}=data
            const newInstrument=InstrumentRepository.create({instrumentOption,instrumentImageLink,instrumentHoverImageLink});
            await InstrumentRepository.save(newInstrument);
            return InstrumentToModel(newInstrument);
        } catch(error){
            console.log(error);
        }
    }
}

export default new CreateInstrumentUseCase();