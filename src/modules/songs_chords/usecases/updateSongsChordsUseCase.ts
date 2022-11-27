import constants from "../../../config/constants/constants";
import { SongsChords } from "../../../entities/SongsChords";
import { SongsChordsRepository } from "../repositories/SongsChordsRepository";

export class UpdateSongsChordsUseCase {
    async execute(chordsID: number, songsID: number) {
        try {
            const relacion = await SongsChordsRepository.findOneBy({
               songsId: songsID,
                chordsId: chordsID
            })
            if (!relacion) {
                return constants.CRUD.SONGS_CHORDS.NOT_FOUND;
            }else{
                return constants.CRUD.SONGS_CHORDS.NOT_FOUND;
            }
        } catch (error) {
            console.log(error)
        }
    }
}

export default new UpdateSongsChordsUseCase()